# Extract Keywords

Select text, right-click → **Services → Extract Keywords**. The on-device Foundation Model returns the key topics and terms as a bullet list, most important first.

## Requirements

- macOS 26 or later (Foundation Models framework) plus an Apple Intelligence-capable Mac
- Xcode Command Line Tools — one-time build (see below)

## Install

1. In Terminal, `cd` into this folder and run `./build.sh` to compile the
   on-device helper.
2. Double-click `Extract Keywords.workflow` — macOS prompts you to install it as a Quick Action.
3. Enable it: **System Settings > General > Login Items & Extensions >
   Extensions > Finder**.
4. Select text, right-click → **Services → Extract Keywords**.

Everything runs on-device — nothing you select is ever uploaded to any server.
