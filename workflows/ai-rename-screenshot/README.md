# AI Rename Screenshot

Inspired by viral threads about auto-naming screenshots with cloud AI — this is the privacy-respecting version: Apple Vision OCR extracts the on-screen text and the on-device Foundation Model turns it into a descriptive filename. Nothing is uploaded anywhere. The shell action sanitizes the proposal, keeps the extension, avoids collisions, and renames in place.

Fully on-device: nothing you select is ever uploaded to any server.

Requirements: macOS 26+ on an Apple Intelligence-capable Mac (Apple Intelligence enabled in System Settings); Xcode Command Line Tools — run `./build.sh` in this folder once to compile the helper.

Build: run `./build.sh` in this folder once (needs the Xcode Command Line Tools), then double-click the `.workflow` file to install. If macOS quarantines the helper, run `xattr -dr com.apple.quarantine "<Name>.workflow"`.

How it works: The Swift helper runs `VNRecognizeTextRequest` on the image, feeds the recognized text to the Foundation Model for a filename, and the shell action applies it safely.
Note: these bundles were authored on Linux and have not yet been compiled or run on a Mac — Mac-tested confirmation is welcome.
