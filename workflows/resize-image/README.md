# Resize Image

Prompts for a target width in pixels, then resizes each selected image to that width while preserving the aspect ratio, using the built-in `sips` tool. Images already narrower than the target are skipped, originals are never modified, and results are saved next to the originals as `<name>-w<width>.<ext>`. Requirements: none (macOS built-in tools only).
