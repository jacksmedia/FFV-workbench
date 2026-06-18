;
; ff5_core.asm
;    Core improvements revision 1.7
;

incsrc ff5_labels.inc
incsrc ff5_core_config.inc

;--------------------------------
; 攻撃が失敗した場合でも表示するメッセージ
;--------------------------------
org FILEPOS_MAGMES_INFO
    db MAGMES_INFO_0X>>8, MAGMES_INFO_0X
    db MAGMES_INFO_1X>>8, MAGMES_INFO_1X
    db MAGMES_INFO_2X>>8, MAGMES_INFO_2X
    db MAGMES_INFO_3X>>8, MAGMES_INFO_3X
    db MAGMES_INFO_4X>>8, MAGMES_INFO_4X
    db MAGMES_INFO_5X>>8, MAGMES_INFO_5X
    db MAGMES_INFO_6X>>8, MAGMES_INFO_6X
    db MAGMES_INFO_7X>>8, MAGMES_INFO_7X

;--------------------------------
; 味方の攻撃時に表示するメッセージ
;--------------------------------
org FILEPOS_MAGMES_ALLY
    db MAGMES_ALLY_0X>>8, MAGMES_ALLY_0X
    db MAGMES_ALLY_1X>>8, MAGMES_ALLY_1X
    db MAGMES_ALLY_2X>>8, MAGMES_ALLY_2X
    db MAGMES_ALLY_3X>>8, MAGMES_ALLY_3X
    db MAGMES_ALLY_4X>>8, MAGMES_ALLY_4X
    db MAGMES_ALLY_5X>>8, MAGMES_ALLY_5X
    db MAGMES_ALLY_6X>>8, MAGMES_ALLY_6X
    db MAGMES_ALLY_7X>>8, MAGMES_ALLY_7X

;--------------------------------
; 敵の攻撃時に表示するメッセージ
;--------------------------------
org FILEPOS_MAGMES_ENEMY
    db MAGMES_ENEMY_0X>>8, MAGMES_ENEMY_0X
    db MAGMES_ENEMY_1X>>8, MAGMES_ENEMY_1X
    db MAGMES_ENEMY_2X>>8, MAGMES_ENEMY_2X
    db MAGMES_ENEMY_3X>>8, MAGMES_ENEMY_3X
    db MAGMES_ENEMY_4X>>8, MAGMES_ENEMY_4X
    db MAGMES_ENEMY_5X>>8, MAGMES_ENEMY_5X
    db MAGMES_ENEMY_6X>>8, MAGMES_ENEMY_6X
    db MAGMES_ENEMY_7X>>8, MAGMES_ENEMY_7X

;--------------------------------
; 戦闘プログラム
;--------------------------------
org $C20003
BATTLE_MAIN:
    PHP
    REP #$30
    PHB
    PHD
    PHA
    PHX
    PHY
    SEP #$20
    JSR $0053       ; 各種レジスタを初期化する
    JSR BATTLE_INIT
    STZ $7CD8       ; 戦闘リセットフラグ (1: ON)

.reset
    JSR $4CE0       ; 戦闘開始処理
    TDC
    STA $002100     ; Screen Display
    STA $00420C     ; HDMA Enable
    STA $00420B     ; DMA Enable
    STA $004200     ; Interrupt Enable Flags
    LDA $7CD8       ; 戦闘リセットフラグ (1: ON)
    BNE .reset

    SEI
    JSR $0053       ; 各種レジスタを初期化する
    REP #$30
    PLY
    PLX
    PLA
    PLD
    PLB
    PLP
    RTL

                    ; /* org $C2003C */
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP

;--------------------------------
; 各種レジスタを初期化する
;--------------------------------
org $C20053
INIT_BATTLE_REGS:
    LDX #$0000
    PHX
    PLD
    TDC
    STA $004200     ; Interrupt Enable Flags
    LDA #$80        ; #$80 = Force Blank
    STA $002100     ; Screen Display
    TDC
    LDA #$7E
    PHA
    PLB
    RTS

;--------------------------------
; 戦闘プログラムのメモリ領域を初期化する
;--------------------------------
org $C24F0A
INIT_BATTLE_RAM:
    LDX #$0067      ; (Init $0000～$0067)

.init_temp
    STZ $00,X
    DEX
    BPL .init_temp

    LDX #$5CD4      ; (Init $2000～$7CD4)

.init_global
    STZ $2000,X
    DEX
    BPL .init_global

    TXA             ; A = 0xFF
    STX $41A9       ; このターン行動できる味方の番号[0]
    STX $41AB       ; このターン行動できる味方の番号[2]
    STA $41AD       ; このターン行動できる味方の番号[4]
    STA $41CC       ; 現在行動中の味方キャラクタの番号
    STA $7C4B       ; 放つモンスターの番号
    LDX #$01FF      ; (Init $384C～$3A4B = 0xFF)

.init_action_script
    STA $384C,X     ; 行動処理スクリプト[0]
    DEX
    BPL .init_action_script

    LDX #$001F

.set_battle_flags
    LDA $09B4,X     ; 魔法のランプを使用した回数
    STA $7C74,X     ; 魔法のランプを使用した回数
    DEX
    BPL .set_battle_flags

    LDA $0AFB       ; タイマーをカウントするかどうか (0: OFF, 2: ON)
    STA $7C94       ; タイマーをカウントするかどうか (0: OFF, 2: ON)
    LDX $0AFC       ; タイマー残り時間
    STX $7C95       ; タイマー残り時間
    LDX $7CD5       ; 所持金(初期値)(下位)
    STX $0947       ; 所持金(下位)
    LDA $7CD7       ; 所持金(初期値)(上位)
    STA $0949       ; 所持金(上位)
    INC $7C72
    RTS

BATTLE_INIT:
    LDX $09C0       ; 戦闘回数
    CPX #$FFFF
    BEQ .battle_count_max

    INX
    STX $09C0       ; 戦闘回数

.battle_count_max
    LDX $0947       ; 所持金(下位)
    STX $7CD5       ; 所持金(初期値)(下位)
    LDA $0949       ; 所持金(上位)
    STA $7CD7       ; 所持金(初期値)(上位)
    RTS

    NOP : NOP : NOP : NOP
    NOP

;--------------------------------
; 全キャラクタの初期パラメータ設定
;--------------------------------
org $C2515C
INIT_CHARACTER_PARAM:
    TDC
    TAY
    TAX

.begin
    LDA $0502,Y     ; レベル
    STA $2002,X     ; レベル
    STZ $2022,X     ; パワーアップ属性

    REP #$20
    LDA $0524,Y     ; 力(装備補正なし) / 素速さ(装備補正なし)
    STA $2024,X     ; 力(装備補正なし) / 素速さ(装備補正なし)
    LDA $0526,Y     ; 体力(装備補正なし) / 魔力(装備補正なし)
    STA $2026,X     ; 体力(装備補正なし) / 魔力(装備補正なし)

    LDA $0508,Y     ; 最大ヒットポイント
    STA $2008,X     ; 最大ヒットポイント
    CMP $2006,X     ; ヒットポイント
    BCS .hp_normal_range

    STA $2006,X     ; ヒットポイント

.hp_normal_range
    STZ $201E,X     ; Clear 状態変化5 & 攻撃修正フラグ
    STZ $2030,X     ; Clear 吸収属性 & 回避属性
    STZ $2032,X     ; Clear 無効属性 & 半減属性
    STZ $2034,X     ; Clear 弱点属性 & 状態変化耐性1
    STZ $2036,X     ; Clear 状態変化耐性2 & 状態変化耐性3
    STZ $2038,X     ; Clear 装備特殊効果フラグ

    TYA
    CLC
    ADC #$0050
    TAY
    TDC
    SEP #$20
    JSR $01E0       ; Xレジスタ += 0x80 (次のキャラクタへ)
    CPX #$0200
    BNE .begin

    RTS

    NOP : NOP : NOP

;--------------------------------
; アイテムの種類/個数が 0 のアイテムをクリアする
;--------------------------------
; /* org $C251AB */
REMOVE_ZEROITEM:
    LDX #$00FF

.begin
    LDA $0640,X     ; アイテム種類
    BEQ .clear_item_c

    LDA $0740,X     ; アイテム個数
    BNE .continue

.clear_item_t
    STZ $0640,X     ; アイテム種類

.clear_item_c
    STZ $0740,X     ; アイテム個数

.continue
    DEX
    BPL .begin

    RTS

;--------------------------------
; Replace 'JSL $D0EF78' with 'JSR REMOVE_ZEROITEM'
;--------------------------------
org $C24246
    JSR REMOVE_ZEROITEM : NOP

org $C2511C
    JSR REMOVE_ZEROITEM : NOP

;--------------------------------
; 戦闘の結果を転送する
;--------------------------------
org $C251F4
TRANSFER_BATTLE_RESULT:
    TDC
    TAX
    LDY #$7C1A      ; キャラクタ番号(bit0-3: 番号 | 20: 女性, 40: 離脱,
                    ; 80: 後列) (初期値)
    STY $10
    TAY

.begin
    STZ $201B,X     ; Clear 状態変化2(一時的状態)
    STZ $201C,X     ; Clear 状態変化3(補助魔法)
    STZ $201D,X     ; Clear 状態変化4
    STZ $201E,X     ; Clear 状態変化5
    NOP : NOP : NOP ; /* reapply_item_immunity: STZ $2035,X */
    NOP : NOP : NOP ; /* reapply_item_immunity: STZ $2036,X */
    NOP : NOP : NOP ; /* reapply_item_immunity: STZ $2037,X */

    LDA ($10)
    STA $2000,X     ; キャラクタ番号(bit0-3: 番号 | 20: 女性, 40: 離脱,
                    ; 80: 後列)
    LDA #$46
    STA $0E

.move_params
    LDA $2000,X     ; キャラクタ番号(bit0-3: 番号 | 20: 女性, 40: 離脱,
                    ; 80: 後列)
    STA $0500,Y     ; キャラクタ番号(bit0-3: 番号 | 20: 女性, 40: 離脱,
                    ; 80: 後列)
    INX
    INY
    DEC $0E
    BNE .move_params

    REP #$21
    TYA
    ADC.w #$0050-$0046
    TAY
    TXA
    ADC.w #$0080-$0046
    TAX
    TDC
    SEP #$20
    INC $10         ; (上位バイトには影響しないため 8 bit accum でインクリメ
                    ; ント)
    CPX #$0200
    BNE .begin

    LDX #$00FF

.move_items
    LDA $2734,X     ; アイテム種類
    STA $0640,X     ; アイテム種類
    BEQ .set_empty

    LDA $2834,X     ; アイテム個数

.set_empty
    STA $0740,X     ; アイテム個数
    BNE .next_item

    STA $0640,X     ; アイテム種類

.next_item
    DEX
    BPL .move_items

    REP #$21
    LDA $094A       ; プレイ時間(下位)
    ADC $DB6E       ; 戦闘中の経過時間(下位)
    STA $094A       ; プレイ時間(下位)
    LDA $094C       ; プレイ時間(上位)
    ADC $DB70       ; 戦闘中の経過時間(上位)
    STA $094C       ; プレイ時間(上位)
    BCC .time_normal_range

    LDA #$FFFF
    STA $094A       ; プレイ時間(下位)
    STA $094C       ; プレイ時間(上位)

.time_normal_range
    TDC
    SEP #$20
    RTS

                    ; /* org $C25276 */
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP

;--------------------------------
; 8 番目のモンスターを対象に指定できるように修正
;--------------------------------
org $C29510
FIX_EIGHTH_MONSTER:
    CPY #$000D      ; <- CPY #$000C

;--------------------------------
; 最初に行動できるキャラクタを決定する処理の間違いを修正
;--------------------------------
org $C24F01
FIX_ATB_INIT:
    NOP
    NOP
    NOP
    CPX #$0200

;--------------------------------
; 敵モンスターが能力値が上昇する歌を歌った場合の処理を修正
;--------------------------------
org $C2234C
FIX_SONG:
    LDX #$0200      ; <- LDX #$0180

;--------------------------------
; モンスターパーティの分岐で上位バイトの値を正確にチェックするように修正
;--------------------------------
org $C20B2C
THROW_IF_SANDWORM:
    LDX $04F0       ; モンスターパーティの種類
    CPX #$01BF
    BEQ .sandworm

    LDX $32         ; 自分アドレスへのインデックス
    LDA $0E
    STA $2058,X     ; 行動の対象(敵)
    BRA $0B46

.sandworm
    LDX $32         ; 自分アドレスへのインデックス
    LDA $0E
    AND #$FC
    STA $2058,X     ; 行動の対象(敵)

org $C23EDF
POISON_IF_MAGISSA:
    LDX $04F0       ; モンスターパーティの種類
    CPX #$01BA
    BEQ $3EEB
    BRA $3F11

org $C2569A
ITEM_DROP_IF_SANDWORM:
    LDX $04F0       ; モンスターパーティの種類
    CPX #$01BF
    BNE $56A7
    RTS

;--------------------------------
; モンスターの最大マジックポイントを設定する
;--------------------------------
org $C23FE0
INIT_MONSTER_MAXMP:
    REP #$20
    LDA $3F09,X     ; MONDATA[10]: マジックポイント
    CMP $220C,Y     ; 最大マジックポイント (= 9999)
    BCC .minimum_mp

    STA $220C,Y     ; 最大マジックポイント

.minimum_mp
    BIT $3F18,X     ; (Check bit7 of MONDATA[26])
    BPL .not_permanence

    TYA
    CLC
    ADC #$0056
    TAY

.not_permanence
    LDA $3F19,X     ; MONDATA[26]: 最初から適用される状態変化1
    AND #$FF7F
    STA $221A,Y     ; 状態変化1(永続的状態) / 状態変化2(一時的状態)
    LDA $3F1B,X     ; MONDATA[28]: 最初から適用される状態変化3
    STA $221C,Y     ; 状態変化3(補助魔法) / 状態変化4
    TDC
    SEP #$20

;--------------------------------
; モンスターの名前を設定する
;--------------------------------
org $C2400A
INIT_MONSTER_NAME:
    LDA $12
    ASL
    TAY
    LDA $3F1D,X     ; MONDATA[30]: モンスターの名前
    STA $4008,Y     ; モンスターの名前(下位)
    LDA $4021,Y     ; モンスター番号(上位)
    CMP #$FF
    BEQ .is_empty   ; (Set モンスターの名前 = 0x00FF)

    STA $4009,Y     ; モンスターの名前(上位)

.is_empty
    REP #$20
    LDA $4020,Y     ; モンスター番号(下位)
    ASL
    TAX
    TDC

;--------------------------------
; 表示するモンスターの名前を決定する
;--------------------------------
org $C25A8C
LOAD_MONSTER_NAME:
    REP #$20
    LDA $4008,X     ; モンスターの名前
    CMP $0E
    BEQ .inc_same_monster

    INY
    INY
    INY
    INY
    STA $4038,Y     ; 1番目のモンスター欄の名前
    STA $0E
    NOP

.inc_same_monster:
    TDC
    SEP #$20
    CLC
    LDA $403A,Y     ; 1番目のモンスター欄の数
    ADC #$01
    STA $403A,Y     ; 1番目のモンスター欄の数

;--------------------------------
; モンスターのパラメータをどのアドレスから読み込むか
;--------------------------------
org $C24D5E
INIT_MONSTER_PARAM:
    TDC
    TAX
    STX $10

org $C24D62
.begin
    ASL
    TAY
    LDA $4021,Y     ; モンスター番号(上位)
    BEQ .normal     ; モンスター番号が 0x00FF 以下なら通常モンスター

    INC             ; モンスター番号が 0xFF00 以上なら通常モンスター
    BNE .boss       ; モンスター番号が 0x0100 以上ならボスモンスター

.normal
    LDA.b #FILEPOS_MONDATA1>>16
    LDY.w #FILEPOS_MONDATA1
    BRA .assign_address

.boss
    LDA.b #FILEPOS_MONDATA2>>16
    LDY.w #FILEPOS_MONDATA2

.assign_address
    STA $14
    STY $12

org $C24DA1
    BNE .begin

;--------------------------------
; From $C29427: 相手の反撃パターンを設定する | 攻撃制御フラグを設定する
;--------------------------------
org $C29761
SET_COMMAND_RESULT:
    JSR $9885       ; 相手の反撃パターンを設定する
    LDA $7B2C       ; 攻撃回数(現在値)
    TAX
    LDA $D0EE85,X   ; ($3BCC: 行動制御) へのインデックス: 0, 7, 14, 21, 28,
                    ; 35, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105
    TAY
    STZ $0E         ; (Reset flags)
    LDA $4747       ; 反撃条件: 魔法の番号
    CMP #$81        ; #$81 = "とくいわざ"
    BNE .unset_specialty

    LDA #$01        ; (Set monster specialty)
    TSB $0E

.unset_specialty
    LDA $7BFB       ; 攻撃動作フラグ (0: 行動する, 0以外: 行動しない)
    BEQ .unset_no_action

    LDA #$20        ; (Set no action)
    TSB $0E

.unset_no_action
    LDA $7C5D       ; (「せいれい」で使用)
    BEQ .unset_alt_palette

    LDA #$02        ; (Set alternate palette?)
    TSB $0E

.unset_alt_palette
    LDA $47         ; 自分の番号(0～3: 味方, 4～: 敵)
    CMP #$04
    BCC .unset_monster

    SBC #$04
    TAX
    LDA #$80        ; (Set monster action)
    TSB $0E
    TXA

.unset_monster
    STA $3BCD,Y     ; 行動制御: 攻撃を行ったキャラクタの番号
    LDA $7B45       ; 相手の番号 (「かばう」によって上書きされる)
    TAX
    CMP #$04
    BCC .unset_attack_to_monster

    SBC #$04
    TAX
    LDA #$40        ; (Set attack to monster side)
    TSB $0E

.unset_attack_to_monster
    LDA $3BCE,Y     ; 行動制御: 攻撃目標
    JSR $01D6       ; Aレジスタの値の(7 - Xレジスタ)ビットをセットする
    STA $3BCE,Y     ; 行動制御: 攻撃目標
    LDA $5F         ; 攻撃エフェクト(クリティカル)
    ORA $61         ; 攻撃エフェクト(魔法剣クリティカル)
    BEQ .unset_flash

    LDA #$10        ; (Set flash)
    TSB $0E

.unset_flash
    LDA $7B40       ; 物理攻撃のダメージを防御した
    BEQ .unset_no_damage

    LDA #$08        ; (Set no damage sound)
    TSB $0E

.unset_no_damage
    LDA $0E         ; (Get flags)
    STA $3BCC,Y     ; 行動制御: フラグ
    LDA $7B46       ; 「リフレク」アニメーション
    BNE .reflected

    LDA $3BCF,Y     ; 行動制御: 実際に攻撃を受けたキャラクタ
    ORA $7B41       ; 攻撃目標ビット
    STA $3BCF,Y     ; 行動制御: 実際に攻撃を受けたキャラクタ
    BRA .check_target

.reflected
    LDA $7B45       ; 相手の番号 (「かばう」によって上書きされる)
    STA $48         ; 相手の番号(0～3: 味方, 4～: 敵)
    LDA $3BD0,Y     ; 行動制御: 「リフレク」で反射したキャラクタ
    ORA $7B42       ; 「リフレク」で反射したキャラクタ
    STA $3BD0,Y     ; 行動制御: 「リフレク」で反射したキャラクタ
    LDA $7B41       ; 攻撃目標ビット
    BEQ .check_target

    LDA $7B2C       ; 攻撃回数(現在値)
    JSR $01B6       ; 8倍する
    STA $0F
    LDA $48         ; 相手の番号(0～3: 味方, 4～: 敵)
    CMP #$04
    BCC .reflected_to_ally

    SBC #$04

.reflected_to_ally
    CLC
    ADC $0F
    TAX
    LDA $7B43       ; 「リフレク」の反射対象
    STA $7B49,X
    LDA $3BD1,Y     ; 行動制御: 「リフレク」の反射対象
    ORA $7B43       ; 「リフレク」の反射対象
    STA $3BD1,Y     ; 行動制御: 「リフレク」の反射対象

.check_target
    LDA $7B44       ; (「かばう」で使用)
    STA $3BD2,Y     ; 行動制御: 「かばう」対象のキャラクタ
    LDA $7B2C       ; 攻撃回数(現在値)
    TAX
    LDA $7B1C,X     ; 攻撃対象の数
    BEQ .end_of_command

    INC $7ABC       ; 攻撃対象の数(現在値)
    CMP $7ABC       ; 攻撃対象の数(現在値)
    BNE .next_target

.end_of_command
    LDA $3BCF,Y     ; 行動制御: 実際に攻撃を受けたキャラクタ
    BNE .target_specific_message

.no_targets_hit
    LDA.b #FILEPOS_MAGMES_INFO>>16
    LDY.w #FILEPOS_MAGMES_INFO
    BRA .clear_battle_message

    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP

.target_specific_message
    LDA $3BCC,Y     ; 行動制御: フラグ
                    ; (if monster action)
    BPL .attack_from_ally

.attack_from_enemy
    LDA.b #FILEPOS_MAGMES_ENEMY>>16
    LDY.w #FILEPOS_MAGMES_ENEMY
    BRA .clear_battle_message

.attack_from_ally
    LDA.b #FILEPOS_MAGMES_ALLY>>16
    LDY.w #FILEPOS_MAGMES_ALLY

.clear_battle_message
    STY $10
    STA $12
    JSR $9965       ; メッセージへのインデックスをセットする (X: 番号,
                    ; Y: パラメータ)
    LDA $3C5F,X     ; メッセージの表示番号
    TAY
    AND #$07
    TAX
    TYA
    LSR
    LSR
    LSR
    TAY
    LDA [$10],Y
    JSR $01DB       ; Aレジスタの値の(7 - Xレジスタ)ビットがセットされていな
                    ; い場合は0クリアする
    BNE .next_command

    JSR $9965       ; メッセージへのインデックスをセットする (X: 番号,
                    ; Y: パラメータ)
    TDC
    STA $3C5F,X     ; メッセージを消去する

.next_command
    INC $7B2C       ; 攻撃回数(現在値)
    INC $79FB       ; 攻撃回数 (ダメージポイント用)
    STZ $7ABC       ; 攻撃対象の数(現在値)
    STZ $7C08       ; マジックポイントを消費したかどうか (1: ON)

.next_target
    RTS

;--------------------------------
; ストーカー処理で 0xFF (空欄) を無視する
;--------------------------------
org $C2758C
FIX_STALKER_PROCESS:
    JSR $01EC       ; Xレジスタと($32: 自分アドレスへのインデックス) =
                    ; Aレジスタ×128
    LDA $201D,X     ; 状態変化4 (01: 逃走, 02: 瀕死状態, 04: 歌っている,
                    ; 08: スリップ, 10: 死の宣告, 20: 向き反転, 40: 偽物,
                    ; 80: 離脱)
    AND #$BF
    STA $201D,X     ; 状態変化4 (01: 逃走, 02: 瀕死状態, 04: 歌っている,
                    ; 08: スリップ, 10: 死の宣告, 20: 向き反転, 40: 偽物,
                    ; 80: 離脱)
    REP #$20
    TDC
    DEC
    STA $0E         ; $0E = 0xFFFF
    TDC
    TAY
    TAX

.set_lowest_hp
    LDA $4020,Y     ; モンスター番号
    CMP #$FFFF
    BEQ .continue

    LDA $2206,X     ; ヒットポイント
    CMP $0E
    BCS .continue

    STA $0E

.continue
    CLC
    TXA
    ADC #$0080
    TAX
    INY
    INY
    CPX #$0200
    BNE .set_lowest_hp

;--------------------------------
; 自分の MP を加算する
;--------------------------------
org $C26766
MP_ADDITION_SELF:
    LDX $7B73       ; 自分のMP回復量
    BMI $679E       ; Skip if $7B73 is 0xFFFF

    LDA $47         ; 自分の番号(0～3: 味方, 4～: 敵)
    JSR $685C       ; Xレジスタ = 表示するダメージ/回復値へのインデックス
                    ; (Aレジスタ: 対象, $26: オフセット)
    REP #$21
    LDA $7B73       ; 自分のMP回復量
    ORA #$8000
    STA $3A4C,X     ; ダメージ表示値 (8000: 回復, 4000: ミス)
    NOP
    NOP
    NOP
    NOP
    LDA $7B73       ; 自分のMP回復量
    AND #$3FFF
    STA $0E
    LDX $32         ; 自分アドレスへのインデックス
    LDA $200A,X     ; マジックポイント
    ADC $0E
    BCS .mp_overflow

    CMP $200C,X     ; 最大マジックポイント
    BCC .mp_normal_range

.mp_overflow
    LDA $200C,X     ; 最大マジックポイント

.mp_normal_range
    STA $200A,X     ; マジックポイント
    TDC
    SEP #$20

;--------------------------------
; 相手の MP を加算する
;--------------------------------
org $C2679E
MP_ADDITION_TARGET:
    LDX $7B75       ; 相手のMP回復量
    BMI $67E0       ; Skip if $7B75 is 0xFFFF

    LDA $7C61       ; 相手の番号 ($48) の代わりに ($7C60) を使う
    BEQ .get_target_no

    LDA $7C60       ; 相手の番号 ($7C61)
    BRA .do_addition

.get_target_no
    LDA $48         ; 相手の番号(0～3: 味方, 4～: 敵)

.do_addition
    JSR $685C       ; Xレジスタ = 表示するダメージ/回復値へのインデックス
                    ; (Aレジスタ: 対象, $26: オフセット)
    REP #$21
    LDA $7B75       ; 相手のMP回復量
    ORA #$8000
    STA $3A4C,X     ; ダメージ表示値 (8000: 回復, 4000: ミス)
    NOP
    NOP
    NOP
    NOP
    LDA $7B75       ; 相手のMP回復量
    AND #$3FFF
    STA $0E
    LDX $49         ; 相手アドレスへのインデックス
    LDA $200A,X     ; マジックポイント
    ADC $0E
    BCS .mp_overflow

    CMP $200C,X     ; 最大マジックポイント
    BCC .mp_normal_range

.mp_overflow
    LDA $200C,X     ; 最大マジックポイント

.mp_normal_range
    STA $200A,X     ; マジックポイント
    TDC
    SEP #$20

;--------------------------------
; 全エフェクトパターンを無効にする
;--------------------------------
org $C1B660
DISABLE_ALL_EFFECTS:
    SEC
    LDA #$70

.begin
    TAX
    STZ $D1D8,X     ; EFFECT[0]: Enable
    STZ $D258,X     ; EFFECT[8]: Enable
    STZ $D2D8,X     ; EFFECT[16]: Enable
    STZ $D358,X     ; EFFECT[24]: Enable
    SBC #$10
    BCS .begin

    RTS

    NOP
    NOP

;--------------------------------
; 行動エフェクト 00h: 魔法攻撃
;--------------------------------
org $C1B677
BATTLE_EFFECT_00h:
    NOP
    NOP
    NOP
    STZ $DB6B       ; 戦闘メニューに重なるエフェクトを非表示 (1: ON)
    STZ $DB77       ; イージスの盾エフェクトを設定する (1: ON)
    STZ $DBDF       ; エフェクト効果音バランス (0: 自動, 1: 標準)
    JSR $9D93       ; ダメージ/回復の表示が終了するまでウェイト
    JSR $B536       ; 使用した魔法の種類に従って発動エフェクトを実行する
    JMP BATTLE_EFFECT_07h

;--------------------------------
; 行動エフェクト 07h: 魔法攻撃 (発動エフェクトなし)
;--------------------------------
org $C1B68C
BATTLE_EFFECT_07h:
    JSR $9D93       ; ダメージ/回復の表示が終了するまでウェイト
    JSR $8D47       ; 魔法の番号を取得する
    TAX
    JMP DO_EFFECT

    NOP
    NOP
    NOP
    NOP
    NOP
    NOP

;--------------------------------
; エフェクトを実行する (Xレジスタ: エフェクト番号)
;--------------------------------
org $C1B69C
DO_EFFECT:
    BRA .do_effect

    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP

;                   ; /* fast_nothing: */
;   CPX #$00AA      ; #$00AA = "何もしない"
;   BEQ .do_nothing
;
;   CPX #$00AC      ; #$00AC = "ノーダメージまほう"
;   BEQ .do_nothing
;
;   CPX #$00EE      ; #$00EE = "モンスター出現状態設定"
;   BNE .do_effect
;
;.do_nothing
;   RTS

.do_effect
    STZ $DB6A       ; リフレクエフェクトを設定した (1: ON)

.do_compound_effect
    STX $F86E       ; エフェクト番号
    STZ $F86D       ; リフレクの反射対象にエフェクトを実行中 (1: ON)
    STZ $DB6B       ; 戦闘メニューに重なるエフェクトを非表示 (1: ON)
    STZ $DB77       ; イージスの盾エフェクトを設定する (1: ON)

.do_additional_effect
    INC $DB77       ; イージスの盾エフェクトを設定する (1: ON)
    STZ $F86A       ; 連続して実行するエフェクト(下位)
    STZ $F86B       ; 連続して実行するエフェクト(上位)
    JSR $A847       ; エフェクトデータを設定する (Xレジスタ: エフェクト番号)
    JSR $B300       ; モンスターグラフィックを再表示する | エフェクト判定用
                    ; フラグを初期化する
    LDA $F582       ; エフェクト処理タイプ
    STA $D1BC       ; 実行中エフェクト処理タイプ
    AND #$3F
    ASL
    TAX
    JSR ($B746,X)
    JSR DISABLE_ALL_EFFECTS
    LDX $F86A       ; 連続して実行するエフェクト
    BNE .do_compound_effect

    LDA $DB61       ; キャラクタ表示フラグ (01: 召喚獣表示)
    BEQ .not_summon

    STZ $F8B4
    LDA #$80
    STA $DB60       ; キャラクタ表示フラグ (01: 更新しない, 80: パーティ非表
                    ; 示)
    JSR $02F2       ; ウェイト(画面を更新する)
    LDA #$10
    STA $BC85       ; Color math designation
    LDA #$1F
    JSR $B3FE       ; Fixed Color Data の色明度を A レジスタの値に設定する
    JSR $24D5       ; キャラクタのグラフィックを再表示する
    JSR $B40A       ; スプライトの色明度を元に戻す
    TDC
    STZ $7E
    JSR $7B43       ;

.wait_bg_reset      ; XXX: $D0EE が 0 でない場合はハングアップする (不要?)
    JSR $02F2       ; ウェイト(画面を更新する)
    LDA $D0EE
    BNE .wait_bg_reset

    LDX $F86E       ; エフェクト番号
    CPX #$0068      ; #$0068 = "ルビーのひかり"
    BNE .not_summon

    LDX #$0000
    STX $F86E       ; エフェクト番号
    LDX #$001F      ; #$001F = "リフレク"
    BRA .do_additional_effect

.not_summon
    STZ $DB56
    LDA $F86D       ; リフレクの反射対象にエフェクトを実行中 (1: ON)
    BNE .end_effect

    INC $F86D       ; リフレクの反射対象にエフェクトを実行中 (1: ON)
    LDX $F86E       ; エフェクト番号
    JSR $8D41       ; 「リフレク」で反射したキャラクタを取得する
    BNE .do_additional_effect

.end_effect
    STZ $DBDF       ; エフェクト効果音バランス (0: 自動, 1: 標準)
    STZ $BC85       ; Color math designation
    JSR $AD2D       ; モンスターの死の宣告の表示を設定する
    JSR $1CB8       ; モンスターグラフィックを再表示する
    JMP $3CBB       ; メッセージを消去する

;--------------------------------
; 文字コード 12h: 魔法名
;--------------------------------
org $C08A85
CHAR_MAGIC_NAME:
    LDA $16A3       ; 魔法の番号
    REP #$20
    ASL
    STA $0F
    ASL
    CLC
    ADC $0F
    TAX             ; X = (魔法の番号)×6
    LDA $06         ; $06 = 0
    SEP #$20
    STZ $09

.next_char
    LDA FILEPOS_MAGNAME,X
    CMP #$E0        ; #$E0 = icon
    BCS .continue

    STA $19D3,Y     ; 文字コード(下位)
    LDA #$00
    STA $1A13,Y     ; 文字コード(上位)
    INY

.continue
    INX
    INC $09
    LDA $09
    CMP #$06
    BNE .next_char

    STY $AB
    JMP $8459

;--------------------------------
; 文字コード 11h: アイテム名
;--------------------------------
org $C08AB7
CHAR_ITEM_NAME:
    LDA $16A2       ; アイテムの番号
    REP #$20
    STA $0F
    ASL
    ASL
    ASL
    CLC
    ADC $0F
    TAX             ; X = (アイテムの番号)×9
    LDA $06         ; $06 = 0
    SEP #$20
    STZ $09

.next_char
    LDA FILEPOS_ITEMNAME,X
    CMP #$E0        ; #$E0 = icon
    BCS .continue

    STA $19D3,Y     ; 文字コード(下位)
    LDA #$00
    STA $1A13,Y     ; 文字コード(上位)
    INY

.continue
    INX
    INC $09
    LDA $09
    CMP #$09
    BNE .next_char

    STY $AB
    JMP $8459

;--------------------------------
; 文字コード 10h: 数値
;--------------------------------
org $C08AEA
CHAR_INTEGER:
    STZ $0C         ; (最初の桁が見つかった)
    LDX $06         ; $06 = 0

.next_num
    LDA $0C         ; (最初の桁が見つかった)
    BNE .num_found

    LDA $10AD,X
    BEQ .continue

    INC $0C         ; (最初の桁が見つかった)

.num_found
    LDA $10AD,X
    CLC
    ADC #$53        ; #$53 = "0"
    STA $19D3,Y     ; 文字コード(下位)
    LDA #$00
    STA $1A13,Y     ; 文字コード(上位)
    INY

.continue
    INX
    CPX #$0007
    BNE .next_num

    STY $AB
    JMP $8459

;--------------------------------
; 戦闘グラフィック処理の初期化
;--------------------------------
org $C10888
INIT_BATTLE_GFX:

org $C1095E
    LDA #$7E
    PHA
    PLB
    LDX #$283E      ; (Init $7EB3B7～$7EDBF5)

.init_1
    STZ $B3B7,X
    DEX
    BPL .init_1

    LDX #$008A      ; (Init $7E0070～$7E00FA)

.init_2
    STZ $0070,X
    DEX
    BPL .init_2

    TDC
    LDX #$01FF      ; (Init $7E7E09～$7E8008)

.init_3
    STA $7E09,X
    DEX
    BPL .init_3

    LDX #$0FFF      ; (Init $7EDCF6～$7EECF5)

.init_4
    STA $DCF6,X
    DEX
    BPL .init_4

    LDX #$005F      ; (Init $7EF789～$7EF7E8)

.init_image
    STZ $F789,X     ; 最後に表示した分身を初期化
    DEX
    BPL .init_image

;--------------------------------
; 宝箱回収率を表示する
;--------------------------------
org $C12EBF
GET_TREASURES_LOOTED:
    TDC
    TAX
    STZ $7E         ; 回収した宝箱の数

.begin
    LDA #$08
    STA $80
    LDA $09D4,X     ; 入手した宝箱フラグ

.get_bit
    ASL
    BCC .not_obtained

    INC $7E         ; 回収した宝箱の数

.not_obtained
    DEC $80
    BNE .get_bit

    INX
    CPX #$0020
    BNE .begin

    STZ $7F
    LDX #$0064
    STX $80
    JSR $FE67       ; 乗算(16bit) (($7E)×($80) = ($82: 32bit))
    LDX $82
    STX $7E
    LDX #TREASURES_TOTAL
    STX $80
    JSR $FDE7       ; 除算(16bit) (($7E)÷($80) = ($82) 余り ($84))
    LDX $82         ; 宝箱回収率
    BRA $2EA7

;--------------------------------
; 最適化
;--------------------------------
PROGRAM_OPTIMIZATION:
org $C21066
    LDA $47         ; 自分の番号(0～3: 味方, 4～: 敵)
    TAX
    LDA $D0EEDB,X   ; ($37DC: 操る) へのインデックス: 0, 20, 40, 60
    TAX
    TDC
    TAY
    NOP
    NOP
    NOP
    NOP
    NOP

org $C21285
    LDA $47         ; 自分の番号(0～3: 味方, 4～: 敵)
    TAX
    LDA $D0EEDB,X   ; ($37DC: 操る) へのインデックス: 0, 20, 40, 60
    TAX
    TDC
    TAY
    NOP
    NOP
    NOP
    NOP
    NOP

org $C219EA
    LDA $41CC       ; 現在行動中の味方キャラクタの番号
    ASL
    TAX
    REP #$21
    LDA $D0ED59,X   ; 魔法アドレスへのインデックス: 0, 650, 1300, 1950
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    ADC #$2D34      ; #$2D34 = 1人目の魔法欄の魔法番号
    STA $45
    TDC
    SEP #$20

org $C21A75
    LDA $41C0       ; 実行するコマンドの番号
    REP #$20
    JSR $01B6       ; 8倍する
    TAX
    TDC
    SEP #$20
    NOP
    NOP

org $C21B0D
    LDA $41CC       ; 現在行動中の味方キャラクタの番号
    TAX
    LDA $D0ED85,X   ; ($4049: 装備データ) へのインデックス: 0, 84, 168, 252
    TAY
    NOP
    NOP
    NOP
    NOP
    NOP

org $C21BBE
    LDA $41CC       ; 現在行動中の味方キャラクタの番号
    TAX
    LDA $D0ED85,X   ; ($4049: 装備データ) へのインデックス: 0, 84, 168, 252
    TAY
    NOP
    NOP
    NOP
    NOP
    NOP

org $C21EA8
    LDA $3D         ; 現在処理中の味方キャラクタの番号
    ASL
    TAX
    REP #$20
    LDA $D0ED59,X   ; 魔法アドレスへのインデックス: 0, 650, 1300, 1950
    TAX
    TDC
    SEP #$20
    NOP

org $C24056
    LDA $12
    ASL
    TAX
    REP #$20
    LDA $D0EEA5,X   ; 0, 1620, 3240, 4860, 6480, 8100, 9720, 11340
    TAX
    TDC
    SEP #$20

org $C293B5
    LDA $47         ; 自分の番号(0～3: 味方, 4～: 敵)
    TAX
    LDA $D0EEDB,X   ; ($37DC: 操る) へのインデックス: 0, 20, 40, 60
    TAX
    TDC
    TAY
    NOP
    NOP
    NOP
    NOP
    NOP

org $C29F42
    LDA $41CC       ; 現在行動中の味方キャラクタの番号
    PHX
    TAX
    LDA $CEFF84,X   ; ($37AC: 装備設定) へのインデックス: 0, 12, 24, 36
    TAY
    PLX
    NOP
    NOP

;--------------------------------
; Get 16-bit digit strings (src: X, dest: $C4)
;--------------------------------
org $C1FF2E
GET_16BIT_DIGIT:
    PHY
    REP #$20
    TXA
    SEP #$11
    LDY $CE         ; digit_chr
    DEY
    STY $7E         ; (digit_chr - 1)

.count_thousands
    SBC #$03E8
    INY
    BCS .count_thousands

    ADC #$03E8      ; (set carry)
    STY $C4         ; digit[0]
    LDY $7E         ; (digit_chr - 1)

.count_hundreds
    SBC #$0064
    INY
    BCS .count_hundreds

    ADC #$0064      ; (set carry)
    STY $C5         ; digit[1]
    LDY $7E         ; (digit_chr - 1)
    SEP #$20

.count_tens
    SBC #$0A
    INY
    BCS .count_tens

    STY $C6         ; digit[2]
    ADC #$0A        ; (set carry)
    ADC $7E         ; (digit_chr - 1)
    STA $C7         ; digit[3]
    REP #$10
    PLY
    RTS

    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP

;--------------------------------
; Get 24-bit digit strings (src: $70, dest: $C4)
;--------------------------------
org $C1FF88
GET_24BIT_DIGIT:
    PHY
    TDC
    TAX
    TAY
    STZ $73

.begin
    REP #$20
    SEC
    STZ $78         ; digit_number

.count
    LDA $70
    SBC $D97D09,X   ; 10000000, 1000000, 100000, 10000, 1000, 100, 10
    STA $74
    LDA $72
    SBC $D97D0B,X   ; 10000000, 1000000, 100000, 10000, 1000, 100, 10
    BCC .break

    STA $72
    LDA $74
    STA $70
    INC $78         ; digit_number
    BRA .count

.break
    SEP #$20
    LDA $78         ; digit_number
    ADC $CE         ; digit_chr
    STA $00C4,Y     ; digit[0]
    INY
    INX
    INX
    INX
    INX
    CPY #$0007
    BNE .begin

    LDA $70
    CLC
    ADC $CE         ; digit_chr
    STA $CB         ; digit[7]
    PLY
    TDC
    RTS

    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP
