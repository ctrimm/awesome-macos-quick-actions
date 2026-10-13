# Detect Text Language

Identifies the language of the selected text using `NLLanguageRecognizer` — fully on-device — and shows the top guesses with confidence as a notification.

Fully on-device: nothing you select is ever uploaded to any server.

Requirements: macOS 12+; Xcode Command Line Tools — run `./build.sh` in this folder once to compile the helper.

Build: run `./build.sh` in this folder once (needs the Xcode Command Line Tools), then double-click the `.workflow` file to install. If macOS quarantines the helper, run `xattr -dr com.apple.quarantine "<Name>.workflow"`.

How it works: Pipes the selected text to a Swift helper that runs `NLLanguageRecognizer` and prints the top 3 hypotheses.
Note: these bundles were authored on Linux and have not yet been compiled or run on a Mac — Mac-tested confirmation is welcome.
