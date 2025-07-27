#!/bin/bash

echo "🦕 T-Rex Logo Setup Script"
echo "=========================="

# Check if tyrannosaurus-rex.png exists in current directory
if [ -f "tyrannosaurus-rex.png" ]; then
    echo "✅ Found tyrannosaurus-rex.png in current directory"
    
    # Copy to frontend assets for main page logo
    echo "📱 Copying to frontend assets..."
    cp tyrannosaurus-rex.png frontend/src/assets/images/tyrannosaurus-rex.png
    
    # Copy to build directory for Mac app icon
    echo "🖥️ Copying to build directory for Mac app icon..."
    cp tyrannosaurus-rex.png build/appicon.png
    
    # Update App.svelte to use image instead of emoji
    echo "🔄 Updating App.svelte to use PNG image..."
    sed -i '' 's/<div class="logo logo-trex">🦕<\/div>/<img alt="T-Rex Text Encryptor" src={logo} class="logo" \/>/' frontend/src/App.svelte
    
    echo "✅ T-Rex logo setup complete!"
    echo ""
    echo "Next steps:"
    echo "1. Run: ./dev.sh build"
    echo "2. Run: ./dev.sh run"
    echo ""
    echo "Your T-Rex PNG will appear as:"
    echo "- 🦕 Main page logo (in app header)"
    echo "- 🦕 Mac app icon (in dock/finder)"
    
else
    echo "❌ tyrannosaurus-rex.png not found in current directory"
    echo ""
    echo "Current status: Using T-Rex emoji (🦕) as placeholder"
    echo ""
    echo "To use a custom T-Rex PNG:"
    echo "1. Place your tyrannosaurus-rex.png file in this directory"
    echo "2. Run this script again: ./copy-trex-logo.sh"
    echo ""
    echo "Logo requirements:"
    echo "- Format: PNG with transparency"
    echo "- Size: 512x512px or larger (square)"
    echo "- Style: Bold, simple design that works at small sizes"
    echo ""
    echo "The emoji T-Rex (🦕) is currently active and looks great!"
fi