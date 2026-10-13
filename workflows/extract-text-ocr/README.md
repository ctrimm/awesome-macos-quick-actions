# Extract Image Text (On-Device OCR)

Runs OCR on each selected image with Apple's on-device Vision framework (`VNRecognizeTextRequest`, accurate mode) and copies the recognized text to the clipboard. No third-party engine needed — this supersedes the tesseract-based variant with a fully built-in, private pipeline.

Fully on-device: nothing you select is ever uploaded to any server.

Requirements: macOS 10.15+; Xcode Command Line Tools — run `./build.sh` in this folder once to compile the helper.

Build: run `./build.sh` in this folder once (needs the Xcode Command Line Tools), then double-click the `.workflow` file to install. If macOS quarantines the helper, run `xattr -dr com.apple.quarantine "<Name>.workflow"`.

How it works: The shell action calls a Swift helper that runs Vision text recognition on each image and prints the text.
Note: these bundles were authored on Linux and have not yet been compiled or run on a Mac — Mac-tested confirmation is welcome.
