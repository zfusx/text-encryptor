# 🦕 T-Rex Text Encryptor

A simple, secure text encryption tool built with state-of-the-art cryptography. Protect your messages before they hit the cloud.

![T-Rex Text Encryptor](frontend/src/assets/images/tyrannosaurus-rex.png)

## 🔥 Why We Built This

It all started a few days ago when we uploaded an encrypted file to Gmail — and immediately got hit with a big red warning. Gmail clearly didn't like it. That got us thinking: Why such hostility to encryption? Maybe it's because they use our emails and documents to train AI models, or share data with surveillance alliances like the Five Eyes.

And if you try to host your own email server? Good luck. Most VPS providers block the necessary ports by default, and even if you get one running, major players like iCloud will silently block your messages. It's starting to feel like 1984, just with better UX.

So we built a tiny workaround: a simple tool to encrypt your emails before sending. Sure, you still have to call your friends and tell them the password. Yes, even your clipboard might betray you. But it's a small, meaningful step to take back some privacy in a world that resents it.

## ⚡ Features

- **🛡️ Military-Grade Encryption**: Argon2id key derivation + ChaCha20-Poly1305 AEAD
- **🔐 Memory-Hard Hashing**: 64MB memory requirement makes brute force attacks expensive
- **🌙 Beautiful Dark/Light Theme**: Tokyo Night inspired design that's easy on the eyes
- **📋 One-Click Copy**: Instantly copy encrypted text to clipboard
- **🔑 Flexible Keys**: Use custom passphrases or generate secure random keys
- **🚀 Lightning Fast**: Native app performance with modern web UI

## 🚀 Quick Start

### Download Pre-Built Binaries

**📦 For Windows Users:**
- Download `text-encryptor-windows.exe` from [Releases](../../releases)
- Run the executable (Windows Defender might warn - click "Run anyway")

**🍎 For Mac Users:**
- Download `text-encryptor-macos.dmg` from [Releases](../../releases)  
- Open the DMG and drag the app to Applications
- First run: Right-click → "Open" (to bypass Gatekeeper)

**🐧 For Linux Users:**
- Clone this repo and build from source (see Building section below)

### How to Use

1. **🔑 Set Your Key**: Enter a strong passphrase or click "Generate" for a random one
2. **📝 Enter Text**: Paste your message in the input area
3. **🔒 Encrypt**: Click "Encrypt Text" to secure your message
4. **📋 Copy & Send**: Copy the encrypted text and send it anywhere
5. **🔓 To Decrypt**: Switch to "Decrypt" mode, paste encrypted text, use same key

## 💡 Pro Tips

- **Strong Passphrases**: Use a mix of letters, numbers, and symbols
- **Share Keys Securely**: Call your recipient to share the password
- **Don't Store Keys**: Memorize important passphrases when possible
- **Test First**: Always test decryption before sending important messages

## 🔐 Security Details

- **Encryption**: ChaCha20-Poly1305 (authenticated encryption)
- **Key Derivation**: Argon2id with 64MB memory, 3 iterations
- **Salt**: 32 random bytes per encryption
- **Authentication**: Built-in MAC prevents tampering
- **Zero Knowledge**: Your keys never leave your device

### 🛡️ Military-Grade Cryptography
T-Rex Text Encryptor uses the **same encryption algorithms** as Signal, WireGuard, and Google Chrome. This isn't amateur crypto - it's **NSA-approved, quantum-resistant** security that would take longer than the age of the universe to break.

**📖 [Read Full Cryptographic Analysis →](ENCRYPTION.md)**

*Learn why this encryption is trusted by billions of users worldwide and how it protects against nation-state attackers.*

## 🛠️ Building from Source

### Prerequisites
- [Go 1.21+](https://golang.org/dl/)
- [Node.js 18+](https://nodejs.org/)
- [Wails v2](https://wails.io/docs/gettingstarted/installation)

### Build Steps
```bash
# Clone the repository
git clone https://github.com/yourusername/text-encryptor.git
cd text-encryptor

# Install Wails (if not already installed)
go install github.com/wailsapp/wails/v2/cmd/wails@latest

# Install frontend dependencies
cd frontend && npm install && cd ..

# Build for your platform
wails build

# Or use our dev script
./dev.sh build
```

### Cross-Platform Builds
```bash
# Windows (from Mac/Linux)
wails build -platform windows/amd64

# macOS (from Linux/Windows) 
wails build -platform darwin/amd64

# Linux
wails build -platform linux/amd64
```

## 🎨 Screenshots

### 🔒 Encrypt Mode
![Encrypt Mode](screenshots/encrypt-mode.png)
*Encrypting sensitive messages with military-grade Argon2id + ChaCha20-Poly1305*

### 🔓 Decrypt Mode  
![Decrypt Mode](screenshots/decrypt-mode.png)
*Decrypting messages with the same secure key*

### 🌙 Tokyo Night Dark Theme
![Dark Theme](screenshots/dark-theme.png)
*Beautiful Tokyo Night inspired design that's easy on the eyes*

## 🤝 Contributing

We welcome contributions! Feel free to:
- 🐛 Report bugs
- 💡 Suggest features  
- 🔧 Submit pull requests
- 📖 Improve documentation

## 📜 License

MIT License - See [LICENSE](LICENSE) for details.

## ⚠️ Disclaimer

This tool is for legitimate privacy protection. Users are responsible for compliance with local laws. Encryption is not illegal, but oppressive regimes might disagree.

---

**🦕 Built with prehistoric power and modern cryptography**

*Remember: The best encryption is useless if your opsec is terrible. Stay safe out there.*
