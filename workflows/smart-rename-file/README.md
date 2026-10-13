# Smart Rename File

Right-click a file > Quick Actions > Smart Rename File. The on-device Foundation Model proposes a short, descriptive, filesystem-safe filename based on the current name and folder context; the shell action sanitizes it, keeps the original extension, avoids collisions (`-2`, `-3`, …), and renames in place.

Fully on-device: nothing you select is ever uploaded to any server.

Requirements: macOS 26+ on an Apple Intelligence-capable Mac (Apple Intelligence enabled in System Settings); Xcode Command Line Tools — run `./build.sh` in this folder once to compile the helper.

Build: run `./build.sh` in this folder once (needs the Xcode Command Line Tools), then double-click the `.workflow` file to install. If macOS quarantines the helper, run `xattr -dr com.apple.quarantine "<Name>.workflow"`.

How it works: The Swift helper asks the Foundation Model for a kebab-case filename; the shell action applies it safely.
Note: these bundles were authored on Linux and have not yet been compiled or run on a Mac — Mac-tested confirmation is welcome.
