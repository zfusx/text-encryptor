#!/bin/bash

echo "🦕 T-Rex Text Encryptor - Cross-Platform Build Script"
echo "===================================================="

# Check if wails is installed
if ! command -v wails &> /dev/null; then
    echo "❌ Wails CLI not found. Installing..."
    go install github.com/wailsapp/wails/v2/cmd/wails@latest
fi

# Create releases directory
mkdir -p releases

echo "🔨 Building for all platforms..."

# Windows 64-bit
echo "📦 Building for Windows 64-bit..."
wails build -platform windows/amd64 -o text-encryptor-windows.exe
if [ $? -eq 0 ]; then
    mv build/bin/text-encryptor-windows.exe releases/
    echo "✅ Windows build completed"
else
    echo "❌ Windows build failed"
fi

# macOS Intel
echo "🍎 Building for macOS Intel..."
wails build -platform darwin/amd64 -o text-encryptor-macos-intel
if [ $? -eq 0 ]; then
    cp -r build/bin/text-encryptor.app releases/text-encryptor-macos-intel.app
    echo "✅ macOS Intel build completed"
else
    echo "❌ macOS Intel build failed"
fi

# macOS Apple Silicon
echo "🍎 Building for macOS Apple Silicon..."
wails build -platform darwin/arm64 -o text-encryptor-macos-arm64
if [ $? -eq 0 ]; then
    cp -r build/bin/text-encryptor.app releases/text-encryptor-macos-arm64.app
    echo "✅ macOS Apple Silicon build completed"
else
    echo "❌ macOS Apple Silicon build failed"
fi

# Linux
echo "🐧 Building for Linux..."
wails build -platform linux/amd64 -o text-encryptor-linux
if [ $? -eq 0 ]; then
    cp build/bin/text-encryptor-linux releases/
    echo "✅ Linux build completed"
else
    echo "❌ Linux build failed"
fi

echo ""
echo "🎉 Build process completed!"
echo "📁 Check the 'releases' folder for your binaries:"
ls -la releases/
echo ""
echo "📋 Next steps:"
echo "1. Test the binaries on different platforms"
echo "2. Create a GitHub release"
echo "3. Upload the binaries to the release"
echo ""
echo "🦕 T-Rex power activated! Your encrypted messages are ready to roam!" 