# Blur Faces in Photo

Right-click one or more photos → **Quick Actions → Blur Faces in Photo**. On-device Vision face detection finds every face, blurs each region, and saves a `-blurred.png` next to the original. Originals are never modified.

## Requirements

- macOS 10.15 or later (Vision face detection is on-device)
- Xcode Command Line Tools — one-time build (see below)

## Install

1. In Terminal, `cd` into this folder and run `./build.sh` to compile the
   on-device helper.
2. Double-click `Blur Faces in Photo.workflow` — macOS prompts you to install it as a Quick Action.
3. Enable it: **System Settings > General > Login Items & Extensions >
   Extensions > Finder**.
4. Right-click photos in Finder → **Quick Actions → Blur Faces in Photo**.

Everything runs on-device — nothing you select is ever uploaded to any server.
