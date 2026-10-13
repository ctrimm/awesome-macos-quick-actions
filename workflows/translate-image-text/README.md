# Translate Image Text

Right-click one or more images → **Quick Actions → Translate Image Text**, pick a target language, and on-device Vision OCR extracts the text while the on-device Translation framework translates it. The translation is shown and copied to the clipboard.

## Requirements

- macOS 15 or later (Translation framework)
- Translation language packs downloaded (System Settings > General > Language & Region)
- Xcode Command Line Tools — one-time build (see below)

## Install

1. In Terminal, `cd` into this folder and run `./build.sh` to compile the
   on-device helper.
2. Double-click `Translate Image Text.workflow` — macOS prompts you to install it as a Quick Action.
3. Enable it: **System Settings > General > Login Items & Extensions >
   Extensions > Finder**.
4. Right-click images in Finder → **Quick Actions → Translate Image Text**, then pick a target language.

Everything runs on-device — nothing you select is ever uploaded to any server.
