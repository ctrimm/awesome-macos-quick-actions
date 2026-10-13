# Combine Images into PDF

Combines the selected images (in alphabetical order) into a single multi-page PDF using only the built-in macOS Quartz/PDFKit frameworks (via the system python3 PyObjC bridge) — no third-party tools. Each image becomes one full page; the result is saved next to the first image as `images.pdf` (numbered if that name is taken). Requirements: none (macOS built-in frameworks only).
