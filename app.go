package main

import (
	"context"
	"crypto/rand"
	"encoding/base64"
	"encoding/hex"
	"fmt"
	"io"

	"golang.org/x/crypto/argon2"
	"golang.org/x/crypto/chacha20poly1305"
)

// App struct
type App struct {
	ctx context.Context
}

// KeyPair represents an encryption key pair
type KeyPair struct {
	Name string `json:"name"`
	Key  string `json:"key"`
}

// EncryptionResult represents the result of encryption
type EncryptionResult struct {
	EncryptedText string `json:"encryptedText"`
	Success       bool   `json:"success"`
	Error         string `json:"error"`
}

// NewApp creates a new App application struct
func NewApp() *App {
	return &App{}
}

// startup is called when the app starts. The context is saved
// so we can call the runtime methods
func (a *App) startup(ctx context.Context) {
	a.ctx = ctx
}

// GetDefaultKey returns a single default key
func (a *App) GetDefaultKey() string {
	return "TokyoNight2024!Argon2id+ChaCha20#StateOfTheArt"
}

// EncryptText encrypts the given text with the provided key using Argon2id + ChaCha20-Poly1305
func (a *App) EncryptText(text, key string) EncryptionResult {
	if text == "" {
		return EncryptionResult{
			Success: false,
			Error:   "Text cannot be empty",
		}
	}

	if key == "" {
		return EncryptionResult{
			Success: false,
			Error:   "Key cannot be empty",
		}
	}

	// Generate a random salt for Argon2id (32 bytes for better security)
	salt := make([]byte, 32)
	if _, err := io.ReadFull(rand.Reader, salt); err != nil {
		return EncryptionResult{
			Success: false,
			Error:   fmt.Sprintf("Failed to generate salt: %v", err),
		}
	}

	// Use Argon2id for key derivation (memory: 64MB, time: 3, threads: 4)
	// These parameters provide strong security while maintaining reasonable performance
	keyBytes := argon2.IDKey([]byte(key), salt, 3, 64*1024, 4, 32)

	// Create ChaCha20-Poly1305 AEAD cipher
	aead, err := chacha20poly1305.New(keyBytes)
	if err != nil {
		return EncryptionResult{
			Success: false,
			Error:   fmt.Sprintf("Failed to create cipher: %v", err),
		}
	}

	// Generate nonce (12 bytes for ChaCha20-Poly1305)
	nonce := make([]byte, aead.NonceSize())
	if _, err := io.ReadFull(rand.Reader, nonce); err != nil {
		return EncryptionResult{
			Success: false,
			Error:   fmt.Sprintf("Failed to generate nonce: %v", err),
		}
	}

	// Encrypt the text (ChaCha20-Poly1305 automatically adds authentication tag)
	ciphertext := aead.Seal(nil, nonce, []byte(text), nil)

	// Combine salt + nonce + ciphertext for storage
	finalData := append(salt, nonce...)
	finalData = append(finalData, ciphertext...)

	// Encode to base64 for easy display
	encoded := base64.StdEncoding.EncodeToString(finalData)

	return EncryptionResult{
		EncryptedText: encoded,
		Success:       true,
	}
}

// DecryptText decrypts the given encrypted text with the provided key using Argon2id + ChaCha20-Poly1305
func (a *App) DecryptText(encryptedText, key string) EncryptionResult {
	if encryptedText == "" {
		return EncryptionResult{
			Success: false,
			Error:   "Encrypted text cannot be empty",
		}
	}

	if key == "" {
		return EncryptionResult{
			Success: false,
			Error:   "Key cannot be empty",
		}
	}

	// Decode from base64
	data, err := base64.StdEncoding.DecodeString(encryptedText)
	if err != nil {
		return EncryptionResult{
			Success: false,
			Error:   fmt.Sprintf("Failed to decode encrypted text: %v", err),
		}
	}

	// Extract salt (first 32 bytes), nonce (next 12 bytes), and ciphertext (remaining)
	if len(data) < 32+12 {
		return EncryptionResult{
			Success: false,
			Error:   "Invalid encrypted data format",
		}
	}

	salt := data[:32]
	nonce := data[32:44]
	ciphertext := data[44:]

	// Derive key using Argon2id with the same parameters
	keyBytes := argon2.IDKey([]byte(key), salt, 3, 64*1024, 4, 32)

	// Create ChaCha20-Poly1305 AEAD cipher
	aead, err := chacha20poly1305.New(keyBytes)
	if err != nil {
		return EncryptionResult{
			Success: false,
			Error:   fmt.Sprintf("Failed to create cipher: %v", err),
		}
	}

	// Decrypt and verify authentication tag
	plaintext, err := aead.Open(nil, nonce, ciphertext, nil)
	if err != nil {
		return EncryptionResult{
			Success: false,
			Error:   fmt.Sprintf("Failed to decrypt or verify authenticity: %v", err),
		}
	}

	return EncryptionResult{
		EncryptedText: string(plaintext),
		Success:       true,
	}
}

// GenerateRandomKey generates a random hex key of specified length
func (a *App) GenerateRandomKey(length int) string {
	if length <= 0 {
		length = 32
	}

	bytes := make([]byte, length)
	if _, err := rand.Read(bytes); err != nil {
		return "defaultkey123456789012345678901234567890"
	}

	return hex.EncodeToString(bytes)[:length]
}

// GetSystemTheme returns the system theme preference
func (a *App) GetSystemTheme() string {
	// This is a simplified version - in a real app you'd use OS-specific APIs
	// For now, we'll let the frontend handle it with CSS media queries
	return "auto"
}
