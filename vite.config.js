import { defineConfig } from 'vite'
import react, { reactCompilerPreset } from '@vitejs/plugin-react'
import babel from '@rolldown/plugin-babel'
import tailwindcss from '@tailwindcss/vite'
import path from 'path'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
    babel({ presets: [reactCompilerPreset()] })
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src'),
      '@components': path.resolve(__dirname, 'src/components'),
      '@hooks': path.resolve(__dirname, 'src/hooks'),
      '@slices': path.resolve(__dirname, 'src/slices'),
      '@routes': path.resolve(__dirname, 'src/routes'),
      '@axios': path.resolve(__dirname, 'src/axios'),
      '@handlers': path.resolve(__dirname, 'src/handlers'),
      '@assets': path.resolve(__dirname, 'src/assets'),
    },
  },
  server: {
    port: 3000,
    strictPort: true, // Optional: forces Vite to fail if port 3000 is busy, instead of automatically trying 3001
  },
})
