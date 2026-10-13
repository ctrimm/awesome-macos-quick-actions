# Translate Text

Translates the selected text with Apple's on-device Translation framework. A dialog asks for the target language (source language is auto-detected); the translation is copied to the clipboard.

Fully on-device: nothing you select is ever uploaded to any server.

Requirements: macOS 15+; the translation language pair must be downloaded in System Settings > General > Language & Region; Xcode Command Line Tools — run `./build.sh` once.

Build: run `./build.sh` in this folder once (needs the Xcode Command Line Tools), then double-click the `.workflow` file to install. If macOS quarantines the helper, run `xattr -dr com.apple.quarantine "<Name>.workflow"`.

How it works: The shell action asks for a target language, then pipes the text to a Swift helper that runs `TranslationSession` with a nil source language (auto-detect), entirely on-device.
Note: these bundles were authored on Linux and have not yet been compiled or run on a Mac — Mac-tested confirmation is welcome.
