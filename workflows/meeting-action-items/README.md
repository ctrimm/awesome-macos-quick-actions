# Meeting Notes to Action Items

Select meeting notes, right-click → **Services → Meeting Notes to Action Items**. The on-device Foundation Model extracts the decisions and turns the rest into an action-item checklist.

## Requirements

- macOS 26 or later (Foundation Models framework) plus an Apple Intelligence-capable Mac
- Xcode Command Line Tools — one-time build (see below)

## Install

1. In Terminal, `cd` into this folder and run `./build.sh` to compile the
   on-device helper.
2. Double-click `Meeting Notes to Action Items.workflow` — macOS prompts you to install it as a Quick Action.
3. Enable it: **System Settings > General > Login Items & Extensions >
   Extensions > Finder**.
4. Select meeting notes, right-click → **Services → Meeting Notes to Action Items**.

Everything runs on-device — nothing you select is ever uploaded to any server.
