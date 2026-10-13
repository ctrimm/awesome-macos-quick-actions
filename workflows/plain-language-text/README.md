# Simplify to Plain Language

Rewrites the selected text in plain, simple language a 12-year-old could understand — short sentences, everyday words, every fact kept. Copied to the clipboard.

Fully on-device: nothing you select is ever uploaded to any server.

Requirements: macOS 26+ on an Apple Intelligence-capable Mac (Apple Intelligence enabled in System Settings); Xcode Command Line Tools — run `./build.sh` in this folder once to compile the helper.

Build: run `./build.sh` in this folder once (needs the Xcode Command Line Tools), then double-click the `.workflow` file to install. If macOS quarantines the helper, run `xattr -dr com.apple.quarantine "<Name>.workflow"`.

How it works: Pipes the selected text to a Swift helper that prompts the on-device Foundation Model with a plain-language instruction.
Note: these bundles were authored on Linux and have not yet been compiled or run on a Mac — Mac-tested confirmation is welcome.
