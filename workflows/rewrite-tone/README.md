# Rewrite in Chosen Tone

Select text, right-click → **Services → Rewrite in Chosen Tone**, pick Professional, Friendly, or Concise from the dialog, and the on-device Foundation Model rewrites it — shown in a dialog and copied to the clipboard.

## Requirements

- macOS 26 or later (Foundation Models framework) plus an Apple Intelligence-capable Mac
- Xcode Command Line Tools — one-time build (see below)

## Install

1. In Terminal, `cd` into this folder and run `./build.sh` to compile the
   on-device helper.
2. Double-click `Rewrite in Chosen Tone.workflow` — macOS prompts you to install it as a Quick Action.
3. Enable it: **System Settings > General > Login Items & Extensions >
   Extensions > Finder**.
4. Select text, right-click → **Services → Rewrite in Chosen Tone**, then pick a tone.

Everything runs on-device — nothing you select is ever uploaded to any server.
