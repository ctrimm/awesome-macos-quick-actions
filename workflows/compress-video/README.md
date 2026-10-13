# Compress Video for Sharing

Re-encodes each selected video to 720p H.264 (CRF 28, fast preset) with 128 kbps AAC audio, producing a much smaller file suitable for sharing. Output is saved next to the original as `<name>-720p.mp4`; the original is never modified. If `ffmpeg` is not installed, a dialog explains how to install it (`brew install ffmpeg`). Requirements: optional `ffmpeg` (`brew install ffmpeg`).
