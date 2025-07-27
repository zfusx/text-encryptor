#!/bin/bash

# Build CSS from stylex.css to style.css
echo "Building CSS from stylex.css to style.css..."
npx tailwindcss -i ./src/stylex.css -o ./src/style.css
echo "CSS build complete!"

# Optional: Watch for changes
if [ "$1" = "--watch" ]; then
  echo "Watching for changes..."
  npx tailwindcss -i ./src/stylex.css -o ./src/style.css --watch
fi