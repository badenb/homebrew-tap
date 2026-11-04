# Sled Dog Homebrew tap

Install on macOS 15 or newer (Apple Silicon or Intel):

```sh
brew install badenb/tap/sled-dog
sled-dog auth login --host github.com
sled-dog pr list --mine
```

Python is bundled. No virtual environment is needed. This is an early-access build; Developer ID signing/notarization is not configured.

Update with `brew update && brew upgrade sled-dog`. Remove with `brew uninstall sled-dog`. Uninstalling preserves saved account settings and credentials; use `sled-dog auth logout` first to remove stored credentials.
