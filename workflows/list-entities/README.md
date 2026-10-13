# List Named Entities

Select text, right-click → **Services → List Named Entities**. On-device NaturalLanguage NER lists the people, places, and organizations mentioned — grouped and deduplicated, shown in a dialog and copied to the clipboard.

## Requirements

- macOS 12 or later (NaturalLanguage is on-device)
- Xcode Command Line Tools — one-time build (see below)

## Install

1. In Terminal, `cd` into this folder and run `./build.sh` to compile the
   on-device helper.
2. Double-click `List Named Entities.workflow` — macOS prompts you to install it as a Quick Action.
3. Enable it: **System Settings > General > Login Items & Extensions >
   Extensions > Finder**.
4. Select text, right-click → **Services → List Named Entities**.

Everything runs on-device — nothing you select is ever uploaded to any server.
