#!/bin/bash

# Development script for Text Encryptor
# This script helps with development workflow

echo "🚀 Text Encryptor Development Helper"
echo "=================================="

# Function to build CSS (not needed since we import stylex.css directly)
build_css() {
    echo "📦 CSS is processed automatically by Vite..."
    echo "✅ No separate CSS build needed!"
}

# Function to build the app
build_app() {
    echo "🔨 Building Wails app..."
    export PATH=$PATH:/Users/fireparty/go/bin
    wails build
    if [ $? -eq 0 ]; then
        echo "✅ App built successfully!"
    else
        echo "❌ Build failed!"
        exit 1
    fi
}

# Function to run the app
run_app() {
    echo "🏃 Running app..."
    open build/bin/text-encryptor.app
}

# Function to develop with hot reload
dev_mode() {
    echo "🔥 Starting development mode..."
    export PATH=$PATH:/Users/fireparty/go/bin
    wails dev
}

# Main menu
case "$1" in
    "css")
        build_css
        ;;
    "build")
        build_app
        ;;
    "run")
        run_app
        ;;
    "dev")
        dev_mode
        ;;
    "full")
        build_app
        run_app
        ;;
    *)
        echo "Usage: $0 {css|build|run|dev|full}"
        echo ""
        echo "Commands:"
        echo "  css   - Build CSS only"
        echo "  build - Build CSS and app"
        echo "  run   - Run the built app"
        echo "  dev   - Start development mode with hot reload"
        echo "  full  - Build everything and run"
        echo ""
        echo "Examples:"
        echo "  ./dev.sh css    # Just build CSS"
        echo "  ./dev.sh build  # Build everything"
        echo "  ./dev.sh dev    # Start dev mode"
        echo "  ./dev.sh full   # Build and run"
        ;;
esac