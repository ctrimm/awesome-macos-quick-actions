# Summarize PDF

Right-click a PDF > Quick Actions > Summarize PDF. Text is extracted with PDFKit (first ~12k characters) and summarized into 5–8 bullet points by the on-device Foundation Model. The summary is saved as `<name>-summary.txt` next to the original; the PDF is untouched.

Fully on-device: nothing you select is ever uploaded to any server.

Requirements: macOS 26+ on an Apple Intelligence-capable Mac (Apple Intelligence enabled in System Settings); Xcode Command Line Tools — run `./build.sh` in this folder once to compile the helper.

Build: run `./build.sh` in this folder once (needs the Xcode Command Line Tools), then double-click the `.workflow` file to install. If macOS quarantines the helper, run `xattr -dr com.apple.quarantine "<Name>.workflow"`.

How it works: The shell action calls a Swift helper that extracts text with PDFKit, summarizes it with `LanguageModelSession`, and writes the sidecar file next to the original.
Note: these bundles were authored on Linux and have not yet been compiled or run on a Mac — Mac-tested confirmation is welcome.
