# Draft Email Reply

Select the text of an email, right-click → **Services → Draft Email Reply**. The on-device Foundation Model drafts a short professional reply, shown in a dialog and copied to the clipboard.

## Requirements

- macOS 26 or later (Foundation Models framework) plus an Apple Intelligence-capable Mac
- Xcode Command Line Tools — one-time build (see below)

## Install

1. In Terminal, `cd` into this folder and run `./build.sh` to compile the
   on-device helper.
2. Double-click `Draft Email Reply.workflow` — macOS prompts you to install it as a Quick Action.
3. Enable it: **System Settings > General > Login Items & Extensions >
   Extensions > Finder**.
4. Select an email's text, right-click → **Services → Draft Email Reply**.

Everything runs on-device — nothing you select is ever uploaded to any server.
