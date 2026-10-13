# Create Video Poster Frame

Grabs a still frame (at the 1-second mark) from each selected video and saves it as `<name>-poster.jpg` next to the original. Uses `ffmpeg` when available; otherwise falls back to the built-in `qlmanage` Quick Look thumbnailer. Originals are never modified. Requirements: none required (built-in `qlmanage` fallback; `ffmpeg` used when present).
