# Generate Headline

Select a draft or article text, right-click → **Services → Generate Headline**. The on-device Foundation Model proposes 5 punchy headline options.

## Requirements

- macOS 26 or later (Foundation Models framework) plus an Apple Intelligence-capable Mac
- Xcode Command Line Tools — one-time build (see below)

## Install

1. In Terminal, `cd` into this folder and run `./build.sh` to compile the
   on-device helper.
2. Double-click `Generate Headline.workflow` — macOS prompts you to install it as a Quick Action.
3. Enable it: **System Settings > General > Login Items & Extensions >
   Extensions > Finder**.
4. Select text, right-click → **Services → Generate Headline**.

Everything runs on-device — nothing you select is ever uploaded to any server.
