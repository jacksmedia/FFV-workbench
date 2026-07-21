import { defineConfig } from 'vite';
import { resolve } from 'path';

export default defineConfig({
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src'),
      '@types': resolve(__dirname, 'src/types'),
      '@constants': resolve(__dirname, 'src/constants'),
      '@parsers': resolve(__dirname, 'src/parsers'),
      '@audio': resolve(__dirname, 'src/audio'),
      '@brr': resolve(__dirname, 'src/brr'),
      '@transpiler': resolve(__dirname, 'src/transpiler'),
      '@rom': resolve(__dirname, 'src/rom'),
      '@components': resolve(__dirname, 'src/components'),
      '@services': resolve(__dirname, 'src/services'),
      '@state': resolve(__dirname, 'src/state'),
      '@utils': resolve(__dirname, 'src/utils'),
    },
  },
  build: {
    target: 'esnext',
    sourcemap: true,
  },
});
