# 🦕 Contributing to T-Rex Text Encryptor

Thank you for your interest in contributing to T-Rex Text Encryptor! This project is built to protect privacy in an increasingly surveilled world, and every contribution helps make secure communication more accessible.

## 🚀 Quick Start

1. **Fork** the repository
2. **Clone** your fork locally
3. **Install** dependencies (see README.md)
4. **Make** your changes
5. **Test** thoroughly
6. **Submit** a pull request

## 🛠️ Development Setup

### Prerequisites
- [Go 1.21+](https://golang.org/dl/)
- [Node.js 18+](https://nodejs.org/)
- [Wails v2](https://wails.io/docs/gettingstarted/installation)

### Local Development
```bash
# Clone your fork
git clone https://github.com/yourusername/text-encryptor.git
cd text-encryptor

# Install frontend dependencies
cd frontend && npm install && cd ..

# Start development server
./dev.sh dev
```

## 🎯 Areas for Contribution

### 🔒 Security Enhancements
- Additional encryption algorithms
- Key derivation improvements  
- Security audits and reviews
- Vulnerability reporting

### 🎨 User Interface
- Accessibility improvements
- Mobile responsiveness
- Theme customization
- UX enhancements

### 🌍 Internationalization
- Multi-language support
- RTL language support
- Locale-specific formatting

### 📱 Platform Support
- Mobile app versions
- Web browser extension
- CLI version
- Additional OS support

### 📚 Documentation
- Usage tutorials
- Security best practices
- Developer documentation
- Video guides

## 🧪 Testing

Before submitting a PR, please ensure:

### Functional Testing
- ✅ Encryption/decryption works correctly
- ✅ Key generation functions properly  
- ✅ Theme switching works
- ✅ Copy-to-clipboard functions
- ✅ Error handling is robust

### Cross-Platform Testing
- ✅ Windows build works
- ✅ macOS (Intel & Apple Silicon) builds work
- ✅ Linux build works
- ✅ UI responsive on different screen sizes

### Security Testing
- ✅ Keys never leak to logs
- ✅ Memory is cleared appropriately
- ✅ Encryption produces different outputs for same input
- ✅ Decryption fails with wrong keys

## 📝 Pull Request Guidelines

### PR Title Format
Use conventional commits:
- `feat: add new encryption algorithm`
- `fix: resolve clipboard issue on Linux`
- `docs: update installation instructions`
- `style: improve dark mode colors`
- `refactor: optimize key derivation`
- `test: add encryption unit tests`

### PR Description Template
```markdown
## What does this PR do?
Brief description of changes.

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## Testing
- [ ] I have tested this change locally
- [ ] I have tested on multiple platforms (if applicable)
- [ ] I have added tests for my changes (if applicable)

## Security Considerations
- [ ] This change does not introduce security vulnerabilities
- [ ] This change does not leak sensitive data
- [ ] This change maintains encryption integrity

## Screenshots (if applicable)
Add screenshots to help explain your changes.
```

## 🔐 Security Considerations

This is a security-focused project. Please:

- **Never** commit credentials, keys, or sensitive data
- **Always** consider the security implications of changes
- **Test** encryption/decryption thoroughly
- **Report** security vulnerabilities privately first
- **Review** cryptographic code carefully

## 🐛 Bug Reports

Use the GitHub issue template and include:

- **Environment**: OS, architecture, Wails version
- **Steps to reproduce**: Clear, numbered steps
- **Expected behavior**: What should happen
- **Actual behavior**: What actually happens
- **Screenshots**: If applicable
- **Logs**: Any relevant error messages

## 💡 Feature Requests

Before submitting a feature request:

1. **Check** existing issues to avoid duplicates
2. **Consider** the security implications
3. **Think** about cross-platform compatibility
4. **Provide** detailed use cases
5. **Suggest** implementation approaches

## 🎨 Code Style

### Go Code
- Follow `gofmt` formatting
- Use meaningful variable names
- Add comments for complex logic
- Handle errors appropriately

### Frontend Code
- Use Prettier for formatting
- Follow Svelte best practices
- Maintain responsive design
- Keep accessibility in mind

### Commit Messages
- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit first line to 72 characters
- Reference issues and pull requests when applicable

## 🏆 Recognition

Contributors will be:
- Added to the README.md contributors section
- Mentioned in release notes for significant contributions
- Invited to be maintainers if consistently contributing

## ❓ Questions?

- **General questions**: Open a GitHub Discussion
- **Bug reports**: Open a GitHub Issue
- **Security issues**: Email directly (see README for contact)
- **Feature ideas**: Open a GitHub Issue with "enhancement" label

## 📜 Code of Conduct

This project follows the [Contributor Covenant](https://www.contributor-covenant.org/). By participating, you are expected to uphold this code.

---

**🦕 Remember: Every contribution makes the digital world a little more private. Thank you for helping protect everyone's digital freedom!** 