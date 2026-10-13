# Remove Background (On-Device AI)

Right-click one or more images → **Quick Actions → Remove Background (On-Device AI)**.
Strips the background using Vision's foreground-instance segmentation — the same
on-device tech behind "lift subject from background" — and saves a `-nobg.png`
with full transparency next to each original. Originals are never modified.
Nothing is uploaded: the entire pipeline runs locally on your Mac.

## Requirements

- macOS 12 Monterey or later (Vision instance masks are on-device)
- Xcode Command Line Tools — one-time build (see below)

## Install

1. In Terminal, `cd` into this folder and run `./build.sh` to compile the
   on-device helper.
2. Double-click `Remove Background (On-Device AI).workflow` — macOS prompts you
   to install it as a Quick Action.
3. Enable it: **System Settings > General > Login Items & Extensions >
   Extensions > Finder**.
4. Right-click images in Finder → **Quick Actions → Remove Background
   (On-Device AI)**.

Works best with images that have a clear foreground subject (people, pets,
products) and are already upright. Files where no subject is found are skipped
with an explanatory message — the originals stay untouched.
