import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import vue from '@vitejs/plugin-vue'
import FullReload from 'vite-plugin-full-reload'

export default defineConfig({
  resolve: {
    extensions: ['.js', '.ts', '.json', '.vue'],
    alias: {
      vue: 'vue/dist/vue.esm-bundler.js',
    },
  },
  plugins: [
    vue(),
    RubyPlugin(),
    FullReload(['config/routes.rb', 'app/views/**/*'], { delay: 200 }),
  ],
  build: {
    sourcemap: true,
  }
})
