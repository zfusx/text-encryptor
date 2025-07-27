<script>
  import logo from "./assets/images/logo-universal.png";
  
  // T-Rex logo configuration
  const USE_EMOJI_LOGO = true; // Set to false to use PNG image
  import {
    EncryptText,
    DecryptText,
    GetDefaultKey,
    GenerateRandomKey,
    GetSystemTheme,
  } from "../wailsjs/go/main/App.js";
  import { onMount } from "svelte";

  let inputText = "";
  let outputText = "";
  let currentKey = "";
  let isEncrypting = true;
  let isLoading = false;
  let errorMessage = "";
  let isDarkMode = false;
  let copySuccess = false;
  let themeMode = 'auto'; // 'auto', 'light', 'dark'

  // Apply theme immediately on script load to prevent flash
  if (typeof window !== 'undefined') {
    const savedTheme = localStorage.getItem('theme') || 'auto';
    themeMode = savedTheme;
    
    const mediaQuery = window.matchMedia("(prefers-color-scheme: dark)");
    
    if (themeMode === 'dark') {
      document.documentElement.setAttribute('data-theme', 'dark');
      isDarkMode = true;
    } else if (themeMode === 'light') {
      document.documentElement.setAttribute('data-theme', 'light');
      isDarkMode = false;
    } else {
      // Auto mode - follow system preference
      document.documentElement.removeAttribute('data-theme');
      isDarkMode = mediaQuery.matches;
    }
  }

  // Initialize app on mount
  onMount(async () => {
    // Load default key
    currentKey = await GetDefaultKey();

    // Load saved theme preference
    const savedTheme = localStorage.getItem('theme') || 'auto';
    themeMode = savedTheme;
    
    // Apply theme immediately
    applyTheme();

    // Set up system theme change listener
    const mediaQuery = window.matchMedia("(prefers-color-scheme: dark)");
    const handleSystemThemeChange = () => {
      if (themeMode === 'auto') {
        applyTheme();
      }
    };
    
    mediaQuery.addEventListener("change", handleSystemThemeChange);
    
    // Cleanup listener on component destroy
    return () => {
      mediaQuery.removeEventListener("change", handleSystemThemeChange);
    };
  });

  function applyTheme() {
    const mediaQuery = window.matchMedia("(prefers-color-scheme: dark)");
    
    if (themeMode === 'dark') {
      document.documentElement.setAttribute('data-theme', 'dark');
      isDarkMode = true;
    } else if (themeMode === 'light') {
      document.documentElement.setAttribute('data-theme', 'light');
      isDarkMode = false;
    } else {
      // Auto mode - follow system preference
      document.documentElement.removeAttribute('data-theme');
      isDarkMode = mediaQuery.matches;
    }
  }

  // Reactive statement to update theme when themeMode changes
  $: if (typeof window !== 'undefined') {
    applyTheme();
  }

  function toggleTheme() {
    const themes = ['auto', 'light', 'dark'];
    const currentIndex = themes.indexOf(themeMode);
    themeMode = themes[(currentIndex + 1) % themes.length];
    
    localStorage.setItem('theme', themeMode);
    applyTheme();
  }

  function getThemeIcon() {
    switch (themeMode) {
      case 'light': return '☀️';
      case 'dark': return '🌙';
      default: return '🌓';
    }
  }

  function useDefaultKey() {
    GetDefaultKey().then((key) => {
      currentKey = key;
    });
  }

  async function processText() {
    if (!inputText.trim()) {
      errorMessage = "Please enter some text";
      return;
    }

    if (!currentKey.trim()) {
      errorMessage = "Please enter a key or generate one";
      return;
    }

    isLoading = true;
    errorMessage = "";

    try {
      let result;
      if (isEncrypting) {
        result = await EncryptText(inputText, currentKey);
      } else {
        result = await DecryptText(inputText, currentKey);
      }

      if (result.success) {
        outputText = result.encryptedText;
      } else {
        errorMessage = result.error;
        outputText = "";
      }
    } catch (error) {
      errorMessage = "An error occurred: " + error.message;
      outputText = "";
    } finally {
      isLoading = false;
    }
  }

  function clearAll() {
    inputText = "";
    outputText = "";
    errorMessage = "";
  }

  async function copyToClipboard() {
    if (outputText) {
      try {
        await navigator.clipboard.writeText(outputText);
        copySuccess = true;
        setTimeout(() => {
          copySuccess = false;
        }, 2000);
      } catch (err) {
        console.error("Failed to copy text: ", err);
      }
    }
  }

  async function generateKey() {
    const newKey = await GenerateRandomKey(48); // Longer key for better security
    currentKey = newKey;
  }
</script>

<main class="app-container">
  <!-- Theme Toggle Button -->
  <button 
    on:click={toggleTheme} 
    class="theme-toggle"
    title="Toggle theme: {themeMode} mode"
  >
    {getThemeIcon()}
  </button>

  <div class="main-container">
    <!-- Header -->
    <div class="header">
      {#if USE_EMOJI_LOGO}
      <img alt="T-Rex Text Encryptor" src={logo} class="logo" />
      {:else}
        <img alt="T-Rex Text Encryptor" src={logo} class="logo" />
      {/if}
      <h1 class="title">Text Encryptor</h1>
      <p class="subtitle">Secure Argon2id + ChaCha20-Poly1305 encryption</p>
    </div>

    <!-- Mode Selector -->
    <div class="mode-selector">
      <button
        class="mode-btn {isEncrypting
          ? 'mode-btn-encrypt'
          : 'mode-btn-inactive'}"
        on:click={() => {
          isEncrypting = true;
          clearAll();
        }}
      >
        🔒 Encrypt
      </button>
      <button
        class="mode-btn {!isEncrypting
          ? 'mode-btn-decrypt'
          : 'mode-btn-inactive'}"
        on:click={() => {
          isEncrypting = false;
          clearAll();
        }}
      >
        🔓 Decrypt
      </button>
    </div>

    <!-- Key Management Section -->
    <div class="card card-key ">
      <h3 class="section-title section-title-key">🔑 Encryption Key</h3>

      <div class="form-group">
        <label for="encryption-key" class="label"
          >Enter your secure passphrase:</label
        >
        <div class="key-input-row">
          <input
            id="encryption-key"
            bind:value={currentKey}
            placeholder="Enter your secure passphrase (e.g., 'MySecret2024!@#')"
            class="input key-input-main"
            type="text"
          />
          <button
            on:click={generateKey}
            class="btn btn-small btn-generate"
            title="Generate secure random key"
          >
            🎲 Generate
          </button>
          <button
            on:click={useDefaultKey}
            class="btn btn-small btn-default"
            title="Use default key"
          >
            🔐 Default
          </button>
        </div>
        <div class="key-info">
          <small
            >💡 Tip: Use a strong passphrase with letters, numbers, and symbols
            for maximum security</small
          >
        </div>
      </div>
    </div>

    <!-- Input Section -->
    <div class="card card-input w-full">
      <h3
        class="section-title {isEncrypting
          ? 'section-title-encrypt'
          : 'section-title-decrypt'}"
      >
        {isEncrypting ? "📝 Text to Encrypt x" : "🔍 Text to Decrypt"}
      </h3>
      <textarea
        bind:value={inputText}
        placeholder={isEncrypting
          ? "Enter your secret text here..."
          : "Paste encrypted text here..."}
        class="input textarea"
        rows="6"
      ></textarea>
    </div>

    <!-- Action Buttons -->
    <div class="action-section">
      <button
        on:click={processText}
        class="btn btn-primary {isEncrypting ? 'btn-encrypt' : 'btn-decrypt'}"
        disabled={isLoading || !inputText.trim()}
      >
        {isLoading
          ? "⏳ Processing..."
          : isEncrypting
            ? "🔒 Encrypt Text"
            : "🔓 Decrypt Text"}
      </button>
      <button on:click={clearAll} class="btn btn-secondary">
        🗑️ Clear All
      </button>
    </div>

    <!-- Error Message -->
    {#if errorMessage}
      <div class="error">
        <span>⚠️</span>
        {errorMessage}
      </div>
    {/if}

    <!-- Output Section -->
    {#if outputText}
      <div class="card card-output w-full">
        <div class="output-header">
          <h3 class="section-title section-title-output">
            {isEncrypting ? "✅ Encrypted Text" : "✅ Decrypted Text"}
          </h3>
          <button on:click={copyToClipboard} class="btn-copy-external">
            {copySuccess ? "✅ Copied!" : "📋 Copy"}
          </button>
        </div>
        <div class="output-container">
          <textarea value={outputText} readonly class="input textarea" rows="6"
          ></textarea>
        </div>
      </div>
    {/if}

    <!-- Encryption Info -->
    <div class="info">
      <p>
        🚀 State-of-the-Art: Argon2id key derivation + ChaCha20-Poly1305 AEAD
        encryption
      </p>
      <p>
        🛡️ Memory-hard hashing (64MB) + authenticated encryption for ultimate
        protection
      </p>
      <p>
        🌃 Tokyo Night Theme: {isDarkMode ? "Dark Mode" : "Light Mode"} 
        ({themeMode === 'auto' ? 'Auto-sync with system' : themeMode.charAt(0).toUpperCase() + themeMode.slice(1) + ' mode'})
      </p>
    </div>
  </div>
</main>
