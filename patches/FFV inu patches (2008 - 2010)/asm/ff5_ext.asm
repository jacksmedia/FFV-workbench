;
; ff5_ext.asm
;    Extended program for ff5_bugfixes revision 1.2
;
; 使用領域/修正
;
;    $C20570-$C20584:   21 bytes
;    $C20632-$C2073D:  268 bytes
;    $C20713-$C20766:   84 bytes
;    $C217DB-$C217E3:    9 bytes
;    $C21939-$C21941:    9 bytes
;    $C221B5-$C221CC:   24 bytes
;    $C2221D-$C22229:   13 bytes
;    $C222DD-$C2222E:    2 bytes
;    $C2230B-$C22318:   14 bytes
;    $C22521-$C2253E:   30 bytes
;    $C283BD-$C2842F:  115 bytes
;    $C29AEB-$C2A9ED:    3 bytes
;    $C29B56-$C29C3F:  234 bytes
;
; 使用領域/追加
;
;    $C20666-$C2066A:    5 bytes - ff5_mimic_blank.ips
;    $C20641-$C20672:   50 bytes - ff5_mimic_weapon.ips
;    $C22220-$C22229:    9 bytes - ff5_condemned.ips
;    $C29BC2-$C29BCC:   11 bytes - ff5_item_evade.ips
;    $C29BAF-$C29BC1:   19 bytes - ff5_item_weight.ips
;    $C20750-$C20766:   23 bytes - ff5_reapply_item_element.ips
;    $C2840D-$C2842B:   31 bytes - ff5_swdslap.ips
;
; 空き領域
;
;    $C2073E-$C2074F:   18 bytes
;    $C221CA-$C221CC:    3 bytes
;    $C2230F-$C22138:   10 bytes
;    $C2252F-$C2253E:   16 bytes
;    $C2842C-$C2842F:    4 bytes
;

incsrc ff5_labels.inc

;--------------------------------
; $7C62 をクリアする場所を変更
;--------------------------------
org $C20570
COMMAND_ITEM:
    JSR $9923       ; A,Yレジスタと($0C) = ($79FA)×12
    JSR $175F       ; 行動の対象を ($65: 行動の対象(敵), $66: 行動の対象(味
                    ; 方)) にコピーする
    LDX $32         ; 自分アドレスへのインデックス
    LDA $2056,X     ; 実行する行動の種類 (01: MPを消費, 08: 連続魔/調合,
                    ; 10: 武器使用, 20: 魔法, 40: アイテム, 80: コマンド)
    AND #$10
    BEQ .not_equip

    JMP USE_WEAPON

.not_equip
    STZ $7C62       ; 使用した装備アイテムの番号

;--------------------------------
; 武器をアイテムとして使用する
;--------------------------------
org $C20632
USE_WEAPON:
    STZ $45         ; 使用した装備アイテム (0: 右手, 1: 左手)
    LDA $47         ; 自分の番号(0～3: 味方, 4～: 敵)
    TAX
    LDA $D0ED85,X   ; ($4049: 装備データ) へのインデックス: 0, 84, 168, 252
    TAY
    LDX $32         ; 自分アドレスへのインデックス
    LDA $205A,X     ; 使用するアイテム/魔法の番号 (0: 右手, 1: 左手)
    BNE .use_left_weapon

.use_right_weapon
    LDA $408B,Y     ; 実行する武器(右手)のデータ[6]: 魔法の番号 (80: 壊れる)
    TAY
    LDA $2013,X     ; 装備品 (右手武器)
    BRA .set_equip_data

.use_left_weapon
    INC $45         ; 使用した装備アイテム (0: 右手, 1: 左手)
    LDA $4097,Y     ; 実行する武器(左手)のデータ[6]: 魔法の番号 (80: 壊れる)
    TAY
    LDA $2014,X     ; 装備品 (左手武器)
    BRA .set_equip_data

.check_mimic
    NOP : NOP       ; /* mimic_weapon: BPL .use_left_weapon */

.mimic_weapon
    NOP : NOP : NOP ; /* mimic_weapon: LDA $7C63 */
    NOP             ; /* mimic_weapon: TAY */
    NOP : NOP : NOP ; /* mimic_weapon: LDA $7C62 */

.set_equip_data
    STA $205A,X     ; 使用するアイテム/魔法の番号
    STA $7C62       ; 使用した装備アイテムの番号
    NOP : NOP       ; /* mimic_weapon: LDA #$80 */
    NOP : NOP : NOP ; /* mimic_weapon: STA $41D8 */
    TYA
    STA $46         ; アイテム使用後に壊れるかどうか (80: 壊れる)
    AND #$7F
    NOP : NOP : NOP ; /* mimic_weapon: STA $7C63 */
    PHA
    LDY $0C
    JSR $0324       ; 実行する攻撃のデータに魔法データをセットする
                    ; (Aレジスタ: 魔法の番号)
    JSR $02C2       ; 行動対象の人数 - 1 をAレジスタと($26A0)に格納する
    BNE .set_target

    LDY $0C
    LDA $7A00,Y     ; 実行する攻撃のデータ[4]
    BPL .do_auto_target

    LDA $79FA       ; 攻撃回数
    TAX
    INC $7BEB,X     ; 行動処理: オートターゲット (0: 有効, 1: 無効)
    BRA .set_target

.do_auto_target
    JSR $4AFE       ; 対象が選択できなければ、別の対象を選択する

.set_target
    JSR $02A9       ; ($65～$66: 行動の対象)を攻撃目標($2720, $2721)に変換す
                    ; る
    LDA $7C62       ; 使用した装備アイテムの番号
    STA $2621
    LDA #$04        ; #$04 = "アイテムの名前"
    STA $2620
    JSR $992F       ; アイテム・魔法・コマンドの名前を表示する ($2620: 種類,
                    ; $2621: 番号)
    JSR $98FA       ; 行動処理スクリプトへの X レジスタを進める
    STZ $384C,X     ; 行動処理スクリプト[0]
    LDA #$FC
    STA $384D,X     ; 行動処理スクリプト[1]: 処理タイプ
    LDA #$0A        ; #$0A = "武器を使用"
    STA $384E,X     ; 行動処理スクリプト[2]: 行動の種類
    PLA
    STA $384F,X     ; 行動処理スクリプト[3]: 魔法・コマンドの番号
    STZ $3850,X     ; 行動処理スクリプト[4]: エフェクト
    LDY $0C
    LDA $79FA       ; 攻撃回数
    TAX
    LDA $7A00,Y     ; 実行する攻撃のデータ[4]
    AND #$7F
    STA $7B2D,X     ; 行動処理: 効果タイプ
    LDA $26A0
    STA $7B1C,X     ; 行動処理: 攻撃対象の数
    BEQ .not_all_target

    INC $7B1C,X     ; 行動処理: 攻撃対象の数
    LDA #$80        ; #$80 = "全体攻撃"

.not_all_target
    STA $7ACC,X     ; 行動処理: フラグ (10: 追加効果, 80: 全体攻撃)
    JSR $1735       ; ($2720, $2721)を攻撃目標として設定する
    JSR $98E3       ; ダメージ/回復値を表示する
    LDA $46         ; アイテム使用後に壊れるかどうか (80: 壊れる)
    BPL .ret

.weapon_break
    LDA $47         ; 自分の番号(0～3: 味方, 4～: 敵)
    TAX
    LDA $CEFF84,X   ; ($37AC: 装備設定) へのインデックス: 0 12, 24, 36
    CLC
    ADC $45         ; 使用した装備アイテム (0: 右手, 1: 左手)
    TAY
    TDC
    STA $37AC,Y     ; 1人目の右手装備
    STA $37AE,Y     ; 1人目の右手装備の数
    STA $37B0,Y
    LDA #$38        ; #$38 = "敵/味方 単体"
    STA $37B2,Y     ; 1人目の右手装備の対象
    LDA #$5A        ; #$5A = "投げられない" | "飲めない" | "何度でも使用でき
                    ; る" | "調合できない"
    STA $37B4,Y     ; 1人目の右手装備の使用フラグ
    LDA #$AA        ; #$AA = "無効"
    STA $37B6,Y     ; 1人目の右手装備の有効フラグ (0: 有効, AA: 無効)
    LDA $3CEF       ; メッセージへのインデックス
    TAY
    LDA #$50        ; ("%sはくだけちった!")
    STA $3C5F,Y     ; メッセージの表示番号
    LDA $3CF0       ; メッセージパラメータへのインデックス
    TAX
    LDA $7C62       ; 使用した装備アイテムの番号
    STA $3CBF,X     ; メッセージの表示パラメータ[0]
    STZ $3CC0,X     ; メッセージの表示パラメータ[1]
    STZ $3CC1,X     ; メッセージの表示パラメータ[2]
    JSR $994C       ; メッセージを表示する
    LDA $41CC       ; 現在行動中の味方キャラクタの番号
    PHA
    LDA $47         ; 自分の番号(0～3: 味方, 4～: 敵)
    STA $41CC       ; 現在行動中の味方キャラクタの番号
    STA $7B7B       ; 自分の番号
    JSR $9F3A       ; 両手の武器/防具をセットする
    PLA
    STA $41CC       ; 現在行動中の味方キャラクタの番号
    INC $7B7D       ; アイテムを入れ替えた回数 (0: 変更していない)
    JSR $9A6F       ; アイテムデータを読み込みステータスを更新する ($7B7B:
                    ; 対象の番号)
    STZ $7B7D       ; アイテムを入れ替えた回数 (0: 変更していない)

.ret
    RTS

                    ; /* org $C2073E */
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP

                    ; /* org $C20750 */
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP

;--------------------------------
; $9A6F を実行してから $7B7D をクリアするように順序を変更
;--------------------------------
org $C217DB
    JSR $9F3A       ; 両手の武器/防具をセットする
    JSR $9A6F       ; アイテムデータを読み込みステータスを更新する ($7B7B:
                    ; 対象の番号)
    STZ $7B7D       ; アイテムを入れ替えた回数 (0: 変更していない)

org $C21939
    JSR $9F3A       ; 両手の武器/防具をセットする
    JSR $9A6F       ; アイテムデータを読み込みステータスを更新する ($7B7B:
                    ; 対象の番号)
    STZ $7B7D       ; アイテムを入れ替えた回数 (0: 変更していない)

;--------------------------------
; 各種タイマーの処理を行う
;--------------------------------
org $C221B5
ENABLE_TIMER:
    LDA $3ECE       ; タイマーの種類
    ASL
    TAX
    JMP ($21CD,X)

;--------------------------------
; ダメージポイント/回復ポイントを表示する
;--------------------------------
DISPLAY_DAMAGE_POINTS:
    LDX $0E
    STX $3C5D
    JSR $0276       ; 表示するダメージ/回復値を設定する (Aレジスタ: 対象,
                    ; $3C5D: ダメージ/回復値)
    LDA #$09        ; #$09 = "ダメージ値の表示"
    JMP $0069       ; 画面を更新する (Aレジスタ: 種類)

                    ; /* org $C221CA */
    NOP : NOP : NOP

;--------------------------------
; タイマータイプ No.001(01): 毒ダメージ
;--------------------------------
org $C2221D
    JMP DISPLAY_DAMAGE_POINTS

                    ; /* org $C22220 */
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP

;--------------------------------
; タイマータイプ No.007(07): リジェネ回復
;--------------------------------
org $C222DD
    BNE $230E

org $C2230B
    JSR DISPLAY_DAMAGE_POINTS
    RTS

                    ; /* org $C2230F */
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP

;--------------------------------
; 各種タイマーのサイクルを設定
;--------------------------------
org $C22521
LOAD_TIMER_CYCLE:
    JSR $253F       ; Yレジスタ = Xレジスタ + ($36: ATB アドレスへのインデッ
                    ; クス)
    TXA
    ASL
    CLC
    ADC $3ED7       ; 2種類のタイマーサイクルのどちらを採用するか (0: 通常,
                    ; 1: 特殊)
    ASL
    TAX
    JMP ($254A,X)

                    ; /* org $C2252F */
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP

;--------------------------------
; 物理攻撃のダメージ算出式の補正
;--------------------------------
org $C283BD
    LDX $32         ; 自分アドレスへのインデックス
    LDA $201F,X     ; 攻撃修正フラグ (04: 防御無視, 08: 倍率1/2,
                    ; 10: 倍率2倍, 20: 攻撃力1/2, 40: 攻撃力2倍,
                    ; 80: 必ず命中)

.atk_double
    BIT #$40
    BEQ .atk_half

    ASL $50         ; 攻撃力(下位)
    ROL $51         ; 攻撃力(上位)

.atk_half
    BIT #$20
    BEQ .mult_double

    LSR $51         ; 攻撃力(上位)
    ROR $50         ; 攻撃力(下位)

.mult_double
    BIT #$10
    BEQ .mult_half

    ASL $52         ; 倍率(下位)
    ROL $53         ; 倍率(上位)

.mult_half
    BIT #$08
    BEQ .ignore_defense

    LSR $53         ; 倍率(上位)
    ROR $52         ; 倍率(下位)

.ignore_defense
    BIT #$04
    BEQ .human_attack

    STZ $54         ; 防御力(下位)
    STZ $55         ; 防御力(上位)

.human_attack
    BIT #$01
    BEQ .defense

    LDX $49         ; 相手アドレスへのインデックス
    LDA $2065,X     ; モンスタータイプ (01: アンデッド, 04: 魔獣,
                    ; 08: エイビス, 10: ドラゴン, 20: ボス, 40: 砂漠,
                    ; 80: 人間)
    BPL .defense

    ASL $50         ; 攻撃力(下位)
    ROL $51         ; 攻撃力(上位)

.defense
    LDX $49         ; 相手アドレスへのインデックス
    LDA $201E,X     ; 状態変化5 (08: いろめ, 10: ジャンプ, 40: 守り,
                    ; 80: 防御)
    BPL .guard

    LSR $53         ; 倍率(上位)
    ROR $52         ; 倍率(下位)

.guard
    BIT #$40
    BEQ .ret

    STZ $50         ; 攻撃力(下位)
    STZ $51         ; 攻撃力(上位)

.ret
    RTS

                    ; /* org $C2840D */
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP : NOP
    NOP : NOP : NOP

;--------------------------------
; アイテムデータを読み込みステータスを更新する ($7B7B: 対象の番号)
;--------------------------------
org $C29A6F
org $C29AEB
    ADC #$0000

org $C29B56
LOAD_ITEM_PARAM:
    TDC
    TAY
    LDX $32         ; 自分アドレスへのインデックス

.begin
    LDA $2623,Y     ; パラメータ(上位)
    BPL .nrange_stat

    TDC
    BRA .assign_stat

.nrange_stat
    LDA $2622,Y     ; パラメータ(下位)

.assign_stat
    STA $2028,X     ; 力(装備補正あり)
    STZ $2050,X     ; 魔法剣 付加属性(2倍) (01: 炎, 02: 氷, 04: 雷, 08: 毒,
                    ; 10: 聖, 20: 地, 40: 風, 80: 水)
    INX
    INY
    INY
    CPY #$0008
    BNE .begin

    STZ $2050,X     ; Unset -> $2054: 魔法剣 付加状態変化2(一時的状態)
    STZ $2051,X     ; Unset -> $2055: 魔法剣 特殊効果フラグ
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP

.load_begin
    LDY $0A
    LDX $32         ; 自分アドレスへのインデックス
    STZ $207A,X     ; 攻撃エフェクトの種類
    LDA $2620
    STA $2022,X     ; パワーアップ属性

.set_category
    LDA $4086,Y     ; 攻撃カテゴリ(右手武器)
    STA $206C,X     ; 攻撃カテゴリ(右手)
    LDA $4092,Y     ; 攻撃カテゴリ(左手武器)
    STA $206D,X     ; 攻撃カテゴリ(左手)

.set_weapon_flag
    LDA $408A,Y     ; 装備特殊効果フラグ(右手武器)
    ORA $4096,Y     ; 装備特殊効果フラグ(左手武器)
    STA $2038,X     ; 装備特殊効果フラグ (02: 追加効果(変化),
                    ; 04: 魔法剣可能, 08: 追加効果, 20: まさむね,
                    ; 40: マインゴーシュ, 80: 佐助の刀/ディフェンダー)

.set_power
    LDA $408C,Y     ; 攻撃力 (右手武器)
    STA $2044,X     ; 右手攻撃力/モンスターの攻撃力
    LDA $4098,Y     ; 攻撃力 (左手手武器)
    STA $2045,X     ; 左手攻撃力/攻撃力の修正値

.set_weight         ; /* org $C29BAF */
    NOP             ; /* item_weight: CLC */
    NOP : NOP : NOP ; /* item_weight: LDA $404A,Y */
    NOP : NOP : NOP ; /* item_weight: ADC $4056,Y */
    NOP : NOP : NOP ; /* item_weight: ADC $4062,Y */
    NOP : NOP : NOP ; /* item_weight: ADC $406E,Y */
    NOP : NOP : NOP ; /* item_weight: ADC $407A,Y */
    NOP : NOP : NOP ; /* item_weight: STA $2023,X */

.set_evade          ; /* org $C29BC2 */
    NOP             ; /* item_evade: CLC */
    NOP : NOP : NOP ; /* item_evade: LDA $404F,Y */
    NOP : NOP : NOP ; /* item_evade: ADC $405B,Y */
    NOP : NOP : NOP ; /* item_evade: ADC $4067,Y */
                    ; /* item_evade: ADC $4073,Y */
    LDA $4073,Y     ; 回避率(右手防具)
    ADC $407F,Y     ; 回避率(左手防具)
    CMP #$63
    BCC .set_evade_nrange

    LDA #$63

.set_evade_nrange
    STA $202C,X     ; 物理回避率

.set_defense
    CLC
    LDA $4050,Y     ; 物理防御力(頭)
    ADC $405C,Y     ; 物理防御力(体)
    BCS .set_defense_max

    ADC $4068,Y     ; 物理防御力(アクセサリ)
    BCS .set_defense_max

    ADC $4074,Y     ; 物理防御力(右手防具)
    BCS .set_defense_max

    ADC $4080,Y     ; 物理防御力(左手防具)
    BCC .assign_defense

.set_defense_max
    LDA #$FF

.assign_defense
    STA $202D,X     ; 物理防御力

.set_mevade
    CLC
    LDA $4051,Y     ; 魔法回避率(頭)
    ADC $405D,Y     ; 魔法回避率(体)
    ADC $4069,Y     ; 魔法回避率(アクセサリ)
    ADC $4075,Y     ; 魔法回避率(右手防具)
    ADC $4081,Y     ; 魔法回避率(左手防具)
    CMP #$63
    BCC .set_mevade_nrange

    LDA #$63
.set_mevade_nrange
    STA $202E,X     ; 魔法回避率

.set_mdefense
    CLC
    LDA $4052,Y     ; 魔法防御力(頭)
    ADC $405E,Y     ; 魔法防御力(体)
    BCS .set_mdefense_max

    ADC $406A,Y     ; 魔法防御力(アクセサリ)
    BCS .set_mdefense_max

    ADC $4076,Y     ; 魔法防御力(右手防具)
    BCS .set_mdefense_max

    ADC $4082,Y     ; 魔法防御力(左手防具)
    BCC .assign_mdefense

.set_mdefense_max
    LDA #$FF

.assign_mdefense
    STA $202F,X     ; 魔法防御力

.set_protecter_flag
    LDA $404E,Y     ; 装備特殊効果フラグ(頭)
    ORA $405A,Y     ; 装備特殊効果フラグ(体)
    ORA $4066,Y     ; 装備特殊効果フラグ(アクセサリ)
    ORA $4072,Y     ; 装備特殊効果フラグ(右手防具)
    ORA $407E,Y     ; 装備特殊効果フラグ(左手防具)
    STA $2039,X     ; 装備特殊効果フラグ (01: HP1/2で捕獲, 02: 不死特性付加,
                    ; 04: 剣の舞確率上昇, 08: 消費MP1/2, 10: 盗み成功率2倍,
                    ; 20: 格闘効果付加, 40: エルフのマント,
                    ; 80: イージスのたて)
