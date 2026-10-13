# Merge PDFs

Merges two or more selected PDFs into a single PDF using only the built-in macOS Quartz/PDFKit frameworks (via the system python3 PyObjC bridge) — no third-party tools. Pages are appended in selection order and the result is saved next to the first file as `merged.pdf` (numbered if that name is taken). Requirements: none (macOS built-in frameworks only).
