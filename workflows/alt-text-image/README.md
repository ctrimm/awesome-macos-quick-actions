# Generate Alt Text for Image

Right-click an image > Quick Actions > Generate Alt Text for Image. Apple's on-device Vision scene classifier (`VNClassifyImageRequest`) identifies what's in the picture and writes a short description to `<name>-alt.txt` next to the original — a handy starting point for accessibility alt text. The image itself is untouched.

Fully on-device: nothing you select is ever uploaded to any server.

Requirements: macOS 10.15+; Xcode Command Line Tools — run `./build.sh` in this folder once to compile the helper.

Build: run `./build.sh` in this folder once (needs the Xcode Command Line Tools), then double-click the `.workflow` file to install. If macOS quarantines the helper, run `xattr -dr com.apple.quarantine "<Name>.workflow"`.

How it works: The Swift helper classifies the image with Vision, composes a sentence from the top labels, and writes the sidecar file next to the original.
Note: these bundles were authored on Linux and have not yet been compiled or run on a Mac — Mac-tested confirmation is welcome.
