# 🦕 T-Rex Logo Setup Guide

## Steps to Replace Logos with T-Rex

### 1. Add T-Rex Logo to Frontend
1. **Save your `tyrannosaurus-rex.png`** file to:
   ```
   text-encryptor/frontend/src/assets/images/tyrannosaurus-rex.png
   ```

2. **Recommended size**: 512x512 pixels or larger (square format)

### 2. Replace Mac App Icon
1. **Save your T-Rex icon** as:
   ```
   text-encryptor/build/appicon.png
   ```
   
2. **Recommended size**: 1024x1024 pixels (macOS app icon standard)

### 3. Build and Test
```bash
cd text-encryptor
./dev.sh build
```

## File Structure After Setup
```
text-encryptor/
├── frontend/src/assets/images/
│   ├── tyrannosaurus-rex.png     # 🦕 Main page logo
│   └── logo-universal.png        # 🗑️ Old logo (can delete)
├── build/
│   └── appicon.png               # 🦕 Mac app icon
└── ...
```

## Logo Requirements

### Main Page Logo (`tyrannosaurus-rex.png`)
- **Size**: 512x512px recommended
- **Format**: PNG with transparency
- **Style**: Should work on both light and dark backgrounds
- **Usage**: Displayed in app header with rounded corners

### Mac App Icon (`appicon.png`)
- **Size**: 1024x1024px (macOS standard)
- **Format**: PNG
- **Style**: Should be recognizable at small sizes
- **Usage**: Dock icon, Finder, etc.

## Current Status
✅ **App.svelte updated** - Now imports `tyrannosaurus-rex.png`
⏳ **Waiting for PNG files** - Add your T-Rex images to the paths above
⏳ **Build required** - Run `./dev.sh build` after adding images

## Tips for T-Rex Logo Design
- **Bold and simple** - Works well at small sizes
- **High contrast** - Visible on Tokyo Night theme backgrounds
- **Square format** - Fits well in circular logo container
- **Transparent background** - Blends with app theme