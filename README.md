# homebrew-muster

Homebrew tap for [Muster](https://github.com/Orazen/Muster).

## Why this exists

The macOS `.dmg` release isn't code-signed/notarized yet (needs an Apple Developer Program
account — tracked upstream). Downloaded directly, macOS Gatekeeper flags it with:

> "Muster" is damaged and can't be opened. You should move it to the Bin.

This is **not** real corruption — it's Gatekeeper reacting to the quarantine flag on an
unsigned/ad-hoc-signed app. Installing via Homebrew avoids this entirely, because `brew install
--cask` clears the quarantine attribute as part of installation.

## Install

```sh
brew tap orazen/muster
brew install --cask muster
```

## Manual fix (if you already downloaded the .dmg directly)

```sh
xattr -cr /Applications/Muster.app
```

Then open it normally.
