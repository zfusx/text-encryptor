#!/bin/bash

echo "🦕 Creating T-Rex App Icon"
echo "========================="

# Check if ImageMagick is available (common on macOS with Homebrew)
if command -v convert &> /dev/null; then
    echo "✅ ImageMagick found - creating T-Rex icon..."
    
    # Create a simple T-Rex icon using ImageMagick
    convert -size 1024x1024 xc:'#2d3748' \
            -fill '#48bb78' \
            -font 'Arial-Bold' \
            -pointsize 600 \
            -gravity center \
            -annotate +0+0 '🦕' \
            build/appicon.png
    
    echo "✅ T-Rex app icon created!"
    echo "📱 Building app with new icon..."
    
    # Rebuild the app
    export PATH=$PATH:/Users/fireparty/go/bin
    wails build
    
    echo "🎉 Done! Your app now has a T-Rex icon in the dock/taskbar!"
    
elif command -v sips &> /dev/null; then
    echo "📝 Using macOS sips to create a colored background..."
    
    # Create a simple colored background (sips is built into macOS)
    # This creates a basic colored square - you'll need to add your T-Rex image
    sips -s format png -s pixelWidth 1024 -s pixelHeight 1024 --setProperty color '#48bb78' /System/Library/CoreServices/DefaultDesktop.heic --out build/appicon.png 2>/dev/null || {
        echo "⚠️  sips method failed, using manual approach..."
        create_manual_instructions
    }
    
else
    create_manual_instructions
fi

create_manual_instructions() {
    echo "📋 Manual T-Rex Icon Setup Instructions"
    echo "======================================="
    echo ""
    echo "Since automatic icon creation tools aren't available, please:"
    echo ""
    echo "1. 🎨 Create or find a T-Rex icon (1024x1024 PNG)"
    echo "   - Use any image editor (Preview, Photoshop, GIMP, etc.)"
    echo "   - Or download a T-Rex icon from the internet"
    echo "   - Make sure it's 1024x1024 pixels"
    echo ""
    echo "2. 💾 Save it as: build/appicon.png"
    echo "   - Replace the existing file"
    echo ""
    echo "3. 🔨 Rebuild the app:"
    echo "   ./dev.sh build"
    echo ""
    echo "4. 🚀 Run the app:"
    echo "   ./dev.sh run"
    echo ""
    echo "Your T-Rex will then appear in:"
    echo "- 🖥️  Dock/Taskbar"
    echo "- 📁 Finder"
    echo "- ⌘ Spotlight search"
    echo "- 🔄 App switcher (Cmd+Tab)"
}

# If no tools available, show manual instructions
if ! command -v convert &> /dev/null && ! command -v sips &> /dev/null; then
    create_manual_instructions
fi