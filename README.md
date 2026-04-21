# homebrew-pulse-cli

Homebrew tap for Pulse CLI — system health monitoring and cache cleanup for macOS developers.

## Install

```bash
brew tap kin0kaze23/pulse-cli
brew install pulse
```

## Usage

```bash
pulse --help
pulse analyze
pulse doctor
```

## Requirements

- macOS 14.0+ (Sonoma or later)
- Xcode 15.0+ command line tools (for building from source)

## Formula

The formula builds Pulse from source using Swift Package Manager. Binary builds are not yet published.

## Development

```bash
brew install --build-from-source ./Formula/pulse.rb
brew test pulse
```
