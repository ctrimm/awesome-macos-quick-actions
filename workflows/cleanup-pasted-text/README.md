# Clean Up Pasted Text

Cleans up text pasted from the web, PDFs, or chat apps: smart quotes become straight quotes, em/en dashes become -- / -, non-breaking and zero-width spaces are removed, trailing whitespace is trimmed, and 3+ blank lines collapse to one. The cleaned text is copied to the clipboard with a before/after character count. A handy companion to macOS Writing Tools.

Fully on-device: nothing you select is ever uploaded to any server.

Requirements: None — uses only built-in macOS tools (python3 ships with macOS).

How it works: A single shell action runs an inline python3 cleanup pass, then copies the result to the clipboard.
