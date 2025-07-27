/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx,svelte}",
  ],
  theme: {
    extend: {
      colors: {
        // Tokyo Night color palette
        'tokyo': {
          'bg-primary': '#1a1b26',
          'bg-secondary': '#24283b', 
          'bg-tertiary': '#414868',
          'bg-light': '#d5d6db',
          'bg-light-secondary': '#e9e9ed',
          'text-primary': '#c0caf5',
          'text-secondary': '#a9b1d6',
          'text-tertiary': '#565f89',
          'text-light': '#343b58',
          'border': '#414868',
          'blue': '#7aa2f7',
          'cyan': '#7dcfff',
          'green': '#9ece6a',
          'yellow': '#e0af68',
          'orange': '#ff9e64',
          'red': '#f7768e',
          'purple': '#bb9af7',
          'magenta': '#c0caf5',
        }
      },
      fontFamily: {
        'mono': ['SF Mono', 'Monaco', 'Menlo', 'Ubuntu Mono', 'monospace'],
      },
      animation: {
        'glow': 'glow 4s ease-in-out infinite',
        'pulse-soft': 'pulse-soft 0.6s ease-in-out',
      },
      keyframes: {
        glow: {
          '0%, 100%': { boxShadow: '0 0 20px rgba(122, 162, 247, 0.3)' },
          '50%': { boxShadow: '0 0 30px rgba(187, 154, 247, 0.4), 0 0 40px rgba(125, 207, 255, 0.2)' },
        },
        'pulse-soft': {
          '0%, 100%': { transform: 'scale(1)' },
          '50%': { transform: 'scale(1.02)' },
        }
      }
    },
  },
  plugins: [],
  darkMode: ['class', '[data-theme="dark"]'],
}