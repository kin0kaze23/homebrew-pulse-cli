# homebrew-pulse-cli

Homebrew tap for Pulse CLI — system health monitoring and cache cleanup for macOS developers.

## Install

### Recommended: Install script

```bash
curl -fsSL https://raw.githubusercontent.com/kin0kaze23/pulse/phase0-hardening/scripts/install.sh | bash
```

This installs the binary directly with shell completions. Works on Apple Silicon and Intel Macs.

### Homebrew tap (build from source)

```bash
brew tap kin0kaze23/pulse-cli
HOMEBREW_NO_SANDBOX=1 brew install pulse --build-from-source
```

> **Note:** `HOMEBREW_NO_SANDBOX=1` is required because Homebrew's sandbox conflicts with SwiftPM's sandbox on macOS 26 SDK. This is a known compatibility issue and will be resolved when pre-built bottles are published.

## Usage

```bash
pulse --help
pulse analyze
pulse doctor
pulse clean --dry-run
```

## Requirements

- macOS 14.0+ (Sonoma or later)
- Xcode 15.0+ command line tools (for building from source)

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/kin0kaze23/pulse/phase0-hardening/scripts/uninstall.sh | bash
```

Or if installed via Homebrew:

```bash
brew uninstall pulse
brew untap kin0kaze23/pulse-cli
```
