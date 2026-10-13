# Summarize Text

Select text in any app, right-click > Quick Actions > Summarize Text. Apple's on-device Foundation Model condenses it into 3–5 bullet points; the summary is copied to the clipboard and shown for review.

Fully on-device: nothing you select is ever uploaded to any server.

Requirements: macOS 26+ on an Apple Intelligence-capable Mac (Apple Intelligence enabled in System Settings); Xcode Command Line Tools — run `./build.sh` in this folder once to compile the helper.

Build: run `./build.sh` in this folder once (needs the Xcode Command Line Tools), then double-click the `.workflow` file to install. If macOS quarantines the helper, run `xattr -dr com.apple.quarantine "<Name>.workflow"`.

How it works: The shell action pipes the selected text to a tiny Swift helper that calls `LanguageModelSession` (Foundation Models framework) and prints the summary.
Note: these bundles were authored on Linux and have not yet been compiled or run on a Mac — Mac-tested confirmation is welcome.
