# Explain Code or Error

Select code or an error message in any app, right-click → **Services → Explain Code or Error**. The on-device Foundation Model explains what the code does — or what the error means, its likely cause, and one suggested fix — in plain language.

## Requirements

- macOS 26 or later (Foundation Models framework) plus an Apple Intelligence-capable Mac
- Xcode Command Line Tools — one-time build (see below)

## Install

1. In Terminal, `cd` into this folder and run `./build.sh` to compile the
   on-device helper.
2. Double-click `Explain Code or Error.workflow` — macOS prompts you to install it as a Quick Action.
3. Enable it: **System Settings > General > Login Items & Extensions >
   Extensions > Finder**.
4. Select code or an error message, right-click → **Services → Explain Code or Error**.

Everything runs on-device — nothing you select is ever uploaded to any server.
