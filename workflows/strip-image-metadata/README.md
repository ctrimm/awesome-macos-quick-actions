# Strip Image Metadata

Removes metadata (EXIF, GPS location, camera info) by re-exporting each selected image with the built-in `sips` tool — JPEGs are re-encoded at quality 100, other formats are re-encoded as PNG. Originals are never modified; cleaned copies are saved as `<name>-stripped.<ext>`. Requirements: none (macOS built-in tools only).
