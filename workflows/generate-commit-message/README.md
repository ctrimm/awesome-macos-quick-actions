# Generate Commit Message

Right-click a git repository folder to generate a conventional-commit message from its uncommitted changes — diff goes to the on-device Foundation Model, and the message is shown and copied to the clipboard. Your code never leaves the Mac.

## Requirements

- macOS 26 or later (Foundation Models framework) plus an Apple Intelligence-capable Mac
- Xcode Command Line Tools — one-time build (see below)

## Install

1. In Terminal, `cd` into this folder and run `./build.sh` to compile the
   on-device helper.
2. Double-click `Generate Commit Message.workflow` — macOS prompts you to install it as a Quick Action.
3. Enable it: **System Settings > General > Login Items & Extensions >
   Extensions > Finder**.
4. Right-click a git repo folder in Finder → **Quick Actions → Generate Commit Message**.

Everything runs on-device — nothing you select is ever uploaded to any server.
