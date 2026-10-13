#!/bin/zsh
# Compile the on-device helper for this Quick Action.
# Requires the Xcode Command Line Tools (xcode-select --install).
# Actions using Foundation Models additionally need Xcode 26 on macOS 26 to compile.
set -euo pipefail
cd "$(dirname "$0")"
SRC="DetectLanguage.swift"
BUNDLE="Detect Text Language.workflow"
OUT="$BUNDLE/Contents/Resources/DetectLanguage"
if ! command -v swiftc >/dev/null 2>&1; then
  echo "error: swiftc not found. Install the Xcode Command Line Tools:" >&2
  echo "  xcode-select --install" >&2
  exit 1
fi
mkdir -p "$BUNDLE/Contents/Resources"
swiftc -O -o "$OUT" "$SRC"
echo "Built $OUT"
echo "Now double-click \"$BUNDLE\" to install it as a Quick Action."
