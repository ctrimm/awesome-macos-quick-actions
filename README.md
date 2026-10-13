# Awesome macOS Finder Quick Actions

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Awesome](https://awesome.re/badge.svg)](https://github.com/sindresorhus/awesome)
[![platform](https://img.shields.io/badge/platform-macOS-blue.svg)](https://www.apple.com/macos/)
[![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![GitHub stars](https://img.shields.io/github/stars/ctrimm/awesome-macos-quick-actions.svg)](https://github.com/ctrimm/awesome-macos-quick-actions/stargazers)
[![Last commit](https://img.shields.io/github/last-commit/ctrimm/awesome-macos-quick-actions.svg)](https://github.com/ctrimm/awesome-macos-quick-actions/commits)

A curated collection of **macOS Finder Quick Actions** — right-click power tools for Finder.

**Quick Actions** are Automator workflows that live in Finder's right-click menu (and the Preview pane): select files or text, right-click, run. They turn repetitive chores — converting images, merging PDFs, copying paths, encoding text — into a single click.

This repo offers **55 ready-to-install `.workflow` bundles** (most need nothing but macOS built-in tools) plus **83 curated links** to excellent actions built by the community — **138 entries** across 9 categories.

**Contributions welcome!** Found or built a great Quick Action? See [CONTRIBUTING.md](CONTRIBUTING.md) for how to add it.

## Install an action

1. Find an action below. Actions whose names link to a `workflows/` folder ship in this repo; all other names link to their external source.
2. **Double-click the `.workflow` file** — macOS prompts you to install it as a Quick Action. (You can also run `open "<Name>.workflow"` from Terminal. Note: installing via `open` moves the bundle out of the repo, so restore it afterward with `git checkout -- workflows/<slug>/` or re-clone.)
3. Enable it: **System Settings > General > Login Items & Extensions > Extensions > Finder** — tick the action on.
4. Right-click files or folders in Finder **> Quick Actions** — your new action is there.

Do **not** copy bundles by hand into `~/Library/Services/` — macOS does not register them properly that way. Always install through the double-click / `open` flow above.

## Contents

- [Images](#images) (40)
- [Audio & Video](#audio--video) (12)
- [PDFs](#pdfs) (13)
- [Text](#text) (15)
- [Files & Folders](#files--folders) (25)
- [Compression & Archives](#compression--archives) (6)
- [Developer Tools](#developer-tools) (20)
- [Productivity](#productivity) (5)
- [Screenshots & Clipboard](#screenshots--clipboard) (2)
- [Other Collections](#other-collections) (5 repos)

*Legend: action names linking to `workflows/…` folders are included in this repo.*

## Images

| Action | Description | Requirements |
|---|---|---|
| [Convert Image to ICNS](workflows/convert-to-icns/) | Converts each selected image to a macOS `.icns` icon file (normalized to 1024px square first); originals untouched. | Built-in tools |
| [Convert to JPEG](workflows/convert-to-jpeg/) | Converts images to JPEG (quality 92) with `sips`; originals untouched. | Built-in tools |
| [Convert to PNG](workflows/convert-to-png/) | Converts images to PNG with `sips`; originals untouched. | Built-in tools |
| [Convert to WebP](workflows/convert-to-webp/) | Converts images to WebP with `sips`; warns instead of failing silently on macOS versions that can't write WebP. | Built-in tools |
| [Convert HEIC to JPEG](workflows/heic-to-jpeg/) | Converts iPhone HEIC/HEIF photos to JPEG (quality 92) for easy sharing. | Built-in tools |
| [Copy Image Dimensions](workflows/copy-image-dimensions/) | Copies `<filename>: <width>x<height>` lines for each image to the clipboard. | Built-in tools |
| [Extract Text from Image to Clipboard](workflows/extract-text-from-image/) | OCRs selected images and copies the recognized text to the clipboard. | optional: tesseract |
| [Flip Image Horizontally](workflows/flip-image-horizontal/) | Mirrors images; saves `-flipped` copies, originals untouched. | Built-in tools |
| [Create Image Contact Sheet](workflows/image-contact-sheet/) | Builds a self-contained `contact-sheet.html` of 320px thumbnails and opens it in the browser. | Built-in tools |
| [Optimize Image](workflows/optimize-image/) | Shrinks JPEGs/PNGs with `sips`; shows before/after sizes and bytes saved. | Built-in tools |
| [Resize Image](workflows/resize-image/) | Prompts for a target width, resizes preserving aspect ratio; skips narrower images. | Built-in tools |
| [Rotate Image 90°](workflows/rotate-image-90/) | Rotates 90° clockwise; run twice for 180°. Saves `-rot90` copies. | Built-in tools |
| [Set Image as Desktop Wallpaper](workflows/set-as-wallpaper/) | Sets the first selected image as the desktop wallpaper via Finder. | Built-in tools |
| [Strip Image Metadata](workflows/strip-image-metadata/) | Removes EXIF, GPS, and camera metadata; saves `-stripped` copies. | Built-in tools |
| [Upscale Image 2x](workflows/upscale-image-2x/) | Doubles pixel dimensions; saves `-2x` copies. | Built-in tools |
| [Remove Background](https://github.com/pepperonas/macos-workflows/tree/main/workflows/remove-background) | Removes the background with Apple Vision AI, keeping only the main subject with transparency. | macOS 14+, Xcode CLI Tools, compiled via build.sh |
| [Remove Nano Banana Watermark](https://github.com/pepperonas/macos-workflows/tree/main/workflows/remove-nano-banana-watermark) | Removes the sparkle watermark from Nano Banana AI-generated images. | Python 3, Pillow |
| [Optimize Image](https://github.com/pepperonas/macos-workflows/tree/main/workflows/optimize-image) | Re-encodes (JPG quality 82, PNG via pngquant); shows before/after size in a notification. | optional: pngquant |
| [Resize to w1024px](https://github.com/pepperonas/macos-workflows/tree/main/workflows/resize-to-w1024px) | Resizes images to 1024px width, aspect preserved; skips smaller images. | Built-in tools (`sips`) |
| [Strip EXIF](https://github.com/pepperonas/macos-workflows/tree/main/workflows/strip-exif) | Removes metadata (GPS, camera info) from images for privacy. | Built-in tools (`sips`) |
| [Add Rounded Corners](https://github.com/pepperonas/macos-workflows/tree/main/workflows/add-rounded-corners) | Adds rounded corners with transparency; great for screenshots in presentations. | Python 3, Pillow |
| [Add Drop Shadow](https://github.com/pepperonas/macos-workflows/tree/main/workflows/add-drop-shadow) | Adds a soft drop shadow around images; ideal for blog posts and docs. | Python 3, Pillow |
| [Convert to JPEG](https://github.com/cheeaun/macos-quick-actions/tree/main/scripts/Convert%20to%20JPEG.workflow) | Creates a JPEG copy of an image file. | None |
| [Resize Images](https://github.com/cheeaun/macos-quick-actions/tree/main/scripts/Resize%20Images.workflow) | Creates resized copies of selected images at a chosen width. | None |
| [Flip Images Horizontally](https://github.com/karl-horning/macos-automator-workflows/tree/main/workflows/images/flip-images-horizontally) | Mirrors selected images left-to-right. Note: modifies files in place. | None |
| [Rotate Images](https://github.com/karl-horning/macos-automator-workflows/tree/main/workflows/images/rotate-images) | Rotates 90° left, 90° right, or 180°. Note: modifies files in place. | None |
| [Scale Images to 1280px](https://github.com/karl-horning/macos-automator-workflows/tree/main/workflows/images/scale-images) | Resizes selected images to 1280px wide. Note: modifies files in place. | None |
| [Normalise JPG Extension Names](https://github.com/karl-horning/macos-automator-workflows/tree/main/workflows/images/normalise-jpg-extension-names) | Renames `.JPEG`/`.JPG` extensions to lowercase `.jpg` for consistency. | None |
| [Duplicate as PNG](https://github.com/yeutterg/automator-workflows/tree/master/Workflows/Duplicate%20as%20PNG.workflow) | Makes a PNG-converted copy of image(s) in the same folder. | None |
| [Create App Iconset](https://github.com/sparanoid/automator-workflows/tree/master/Create%20App%20Iconset.workflow) | Generates the full set of macOS app-icon sizes (1024 down to 16) from a 1024px source. | None |
| [Add @2x/@3x Suffix](https://github.com/sparanoid/automator-workflows/tree/master/Add%20@2x%20Suffix.workflow) | Adds `@2x` (or `@3x`, via companion workflow) suffix to retina asset filenames. | None |
| [Create @2x/@3x Image](https://github.com/sparanoid/automator-workflows/tree/master/Create%20@2x%20Image.workflow) | Auto-downscales retina-size images to create `@2x` (or `@3x`) versions. | None |
| [Remove @2x/@3x Suffix](https://github.com/sparanoid/automator-workflows/tree/master/Remove%20@2x%20Suffix.workflow) | Removes `@2x` (or `@3x`) suffix from retina asset filenames. | None |
| [Convert Image Format](https://github.com/sparanoid/automator-workflows/tree/master/Convert%20Image%20Format.workflow) | Converts selected images to a specific format. | None |
| [Convert WebP to PNG](https://github.com/sparanoid/automator-workflows/tree/master/Convert%20WebP%20to%20PNG.workflow) | Converts selected WebP images to PNG. | optional: webp (`dwebp` via Homebrew) |
| [Resize Image for WordPress](https://github.com/sparanoid/automator-workflows/tree/master/Resize%20Image%20for%20WordPress.workflow) | Resizes images to WordPress-friendly dimensions. | None |
| [Compress Images](https://github.com/sparanoid/automator-workflows/tree/master/Compress%20Images.workflow) | Compresses PNG, JPG, and SVG with OptiPNG, pngcrush, jpegoptim, and svgo; auto-detects type. | optional: jpegoptim, svgo via Homebrew (OptiPNG/pngcrush bundled) |
| [Crop Image to 1080p](https://github.com/princelundgren/automator-collection/tree/master/Crop%20image%20to%201080p.workflow) | Crops any image to forced 1920x1080; great for wallpapers. | None |
| [Crop Image to 720p](https://github.com/princelundgren/automator-collection/tree/master/Crop%20image%20to%20720p.workflow) | Crops any image to forced 1280x720; great for wallpapers. | None |
| [ImageOptim (Finder Service)](https://imageoptim.com) | Right-click any image (or folder of them) to lossy/lossless-compress in place, no app window. | None (ImageOptim app install) |

## Audio & Video

| Action | Description | Requirements |
|---|---|---|
| [Compress Video for Sharing](workflows/compress-video/) | Re-encodes to 720p H.264 (CRF 28) + 128 kbps AAC; saves `-720p.mp4` next to the original. | optional: ffmpeg |
| [Convert Video to MP4 (H.264)](workflows/convert-video-to-mp4/) | Re-encodes to widely compatible MP4 (CRF 23, 160 kbps AAC); original untouched. | optional: ffmpeg |
| [Extract Audio from Video (M4A)](workflows/extract-audio-m4a/) | Extracts the audio track as 192 kbps AAC in an M4A container. | optional: ffmpeg |
| [Extract Audio from Video (MP3)](workflows/extract-audio-mp3/) | Extracts the audio track as high-quality MP3 (LAME VBR quality 4). | optional: ffmpeg |
| [Create Video Poster Frame](workflows/video-poster-frame/) | Grabs a still frame at 1 second as `-poster.jpg`; uses the built-in Quick Look thumbnailer when ffmpeg is absent. | None (optional: ffmpeg) |
| [Convert Video to Animated GIF](workflows/video-to-gif/) | 480px-wide GIF at 12 fps using a two-pass palette for good color. | optional: ffmpeg |
| [Rename Tracks](https://github.com/pepperonas/macos-workflows/tree/main/workflows/rename-tracks) | Normalises music filenames to `Artist - Title.ext`: title case, strips download clutter; shows preview + undo log. | Python 3 (standard library) |
| [Convert](https://github.com/hexdrx/awesome-quick-actions/tree/main/Convert) | Right-click any image/audio/video, pick a target format from a native dropdown; batch handling, progress bar, collision-safe names. | optional: ffmpeg (Homebrew) for audio/video |
| [Transcribe](https://github.com/hexdrx/awesome-quick-actions/tree/main/Transcribe) | Transcribes audio/video to a `.txt` next to the original: English via Apple's on-device recognizer, Russian via GigaAM v3. | macOS 26+ (English engine), ffmpeg |
| [Convert Selected Text to Audio File](https://github.com/sparanoid/automator-workflows/tree/master/Convert%20Selected%20Text%20to%20Audio%20File.workflow) | Converts selected text to an AIFF audio file in any application. | None |
| [Convert .ass to .srt](https://github.com/sparanoid/automator-workflows/tree/master/Convert%20.ass%20to%20.srt.workflow) | Converts `.ass` subtitle files to `.srt`. | sorz/asstosrt |
| [Convert Video to 1080p](https://github.com/princelundgren/automator-collection/tree/master/Convert%20video%20to%201080p%28Google%20Cardboard%20compatible%29.workflow) | Converts a video to a small 1080p file compatible with Cardboard players, VLC, and most devices. | None |

## PDFs

| Action | Description | Requirements |
|---|---|---|
| [Compress PDF](workflows/compress-pdf/) | Re-compresses PDFs with Ghostscript (`/ebook` preset); saves `-compressed.pdf`, original untouched. | optional: ghostscript |
| [Combine Images into PDF](workflows/images-to-pdf/) | Each image becomes a full page of one PDF via built-in Quartz/PDFKit. | Built-in tools |
| [Merge PDFs](workflows/merge-pdfs/) | Merges two or more PDFs in selection order; saves `merged.pdf`. | Built-in tools |
| [Split PDF into Pages](workflows/split-pdf/) | Splits each PDF into one file per page: `<name>-p001.pdf`, `-p002.pdf`, … | Built-in tools |
| [Combine PDF 4-in-1 (Portrait)](https://github.com/vinayakchandra/combine-pdf-4in1/tree/main/pdf_4in1.workflow) | Combines PDF, Word, and PowerPoint files into a portrait A4 PDF, up to 4 pages per sheet (2x2). | Python 3, PyMuPDF (Word/PowerPoint need Office or Pages) |
| [Combine PDF 4-in-1 (Landscape)](https://github.com/vinayakchandra/combine-pdf-4in1/tree/main/pdf_4in1_landscape.workflow) | Same 2x2 combining, but with a landscape A4 output for wide slides. | Python 3, PyMuPDF (Word/PowerPoint need Office or Pages) |
| [Number Pages Sequentially](https://github.com/karl-horning/macos-automator-workflows/tree/main/workflows/images/number-pages-sequentially) | Renames selected images to `PAGE_0000` format (starting at 0) for feeding into PDF creation. | None |
| [New PDF from Images](https://github.com/karl-horning/macos-automator-workflows/tree/main/workflows/pdf/new-pdf-from-images) | Creates a single PDF from selected images; originals untouched. | None |
| [Split PDF](https://github.com/karl-horning/macos-automator-workflows/tree/main/workflows/pdf/split-pdf) | Splits a multi-page PDF into one file per page. | None |
| [Split PDF into Images](https://github.com/yeutterg/automator-workflows/tree/master/Workflows/Split%20PDF%20Into%20Images....workflow) | Saves every PDF page as an image, with colorspace, type, resolution, and compression options in a dialog. | None |
| [Combine PDFs](https://github.com/yeutterg/automator-workflows/tree/master/Workflows/Combine%20PDFs....workflow) | Combines multiple selected PDFs into one file with a chosen name. | None |
| [Extract PDF Text](https://github.com/yeutterg/automator-workflows/tree/master/Workflows/Extract%20PDF%20Text.workflow) | Extracts selectable text from PDF(s) into a same-named text file. | None |
| [Compress PDF Size](https://github.com/princelundgren/automator-collection/tree/master/Compress%20PDF%20Size%28Larger%29.workflow) | Compresses images inside PDFs at Smaller/Medium/Larger tiers; Larger nearly halves size at near-original quality. | None |

## Text

| Action | Description | Requirements |
|---|---|---|
| [Remove Duplicate Lines](workflows/dedupe-lines/) | Removes duplicate lines (keeps first occurrences in original order) to the clipboard. | Built-in tools |
| [QR Encode Text](workflows/qr-encode/) | Renders the selected text as a QR code PNG on the clipboard. | optional: qrencode |
| [Sort Lines](workflows/sort-lines/) | Sorts the lines of the selected text alphabetically to the clipboard. | Built-in tools |
| [Lowercase Text](workflows/text-lowercase/) | Converts selected text to lowercase (Unicode-aware) to the clipboard. | Built-in tools |
| [Text Stats](workflows/text-stats/) | Shows word, character, and line counts as a macOS notification. | Built-in tools |
| [Title Case Text](workflows/text-title-case/) | Converts selected text to Title Case (Unicode-aware) to the clipboard. | Built-in tools |
| [Uppercase Text](workflows/text-uppercase/) | Converts selected text to UPPERCASE (Unicode-aware) to the clipboard. | Built-in tools |
| [Timestamp to Date](workflows/timestamp-to-date/) | Converts a selected unix timestamp (10-digit seconds or 13-digit ms) to a readable local date/time. | Built-in tools |
| [JSON Prettify](https://github.com/pepperonas/macos-workflows/tree/main/workflows/json-prettify) | Formats selected JSON text with proper indentation to the clipboard. | Python 3 |
| [Convert Case](https://github.com/pepperonas/macos-workflows/tree/main/workflows/convert-case) | Auto-detects and converts between camelCase, snake_case, and kebab-case. | None |
| [WhatsApp Line Wrap](https://github.com/pepperonas/macos-workflows/tree/main/workflows/whatsapp-line-wrap) | Wraps text to 40-character lines for WhatsApp readability; converts ASCII tables to card format. | Python 3 |
| [Remove Vowels](https://github.com/pepperonas/macos-workflows/tree/main/workflows/remove-vowels) | Removes all vowels, including German umlauts (ae oe ue), from selected text. | Built-in tools (`tr`) |
| [Text Statistics](https://github.com/pepperonas/macos-workflows/tree/main/workflows/text-statistics) | Shows word, character, and line count of selected text as a notification. | None |
| [Translate to English](https://github.com/cheeaun/macos-quick-actions/tree/main/scripts/Translate%20to%20English.workflow) | Translates selected text to English, showing a popup of the Google Translate result. | None |
| [Count Words](https://github.com/yeutterg/automator-workflows/tree/master/Workflows/Count%20Words.workflow) | Counts highlighted words and shows the count in a dialog. | None |

## Files & Folders

| Action | Description | Requirements |
|---|---|---|
| [Batch Rename Date](workflows/batch-rename-date/) | Appends today's `_YYYY-MM-DD` stamp before the extension; skips collisions. | Built-in tools |
| [Batch Rename Prefix](workflows/batch-rename-prefix/) | Prompts for a prefix and prepends it to every selected name; reports renamed vs skipped. | Built-in tools |
| [Batch Rename Suffix](workflows/batch-rename-suffix/) | Prompts for a suffix and inserts it before the extension (`photo.jpg` → `photo_v2.jpg`); skips collisions. | Built-in tools |
| [Copy File Size](workflows/copy-file-size/) | Copies human-readable sizes to the clipboard, one per line (`photo.jpg: 2.4 MB`). | Built-in tools |
| [Copy File URL](workflows/copy-file-url/) | Copies percent-encoded `file://` URLs to the clipboard, one per line. | Python 3 |
| [Copy Filename](workflows/copy-filename/) | Copies just the filenames (no folder paths) to the clipboard, one per line. | Built-in tools |
| [Copy Parent Folder Path](workflows/copy-parent-path/) | Copies containing folder paths, deduplicated so shared parents appear once. | Built-in tools |
| [Copy Path](workflows/copy-path/) | Copies the POSIX path of every selected file or folder to the clipboard, one per line. | Built-in tools |
| [Folder Tree](workflows/folder-tree/) | Copies a recursive, indented text tree of each selected folder; skips `.git`, `node_modules`, `.DS_Store`. | Built-in tools |
| [New Folder](workflows/new-folder/) | Creates a collision-safe Untitled Folder inside each selected folder (or next to each file). | Built-in tools |
| [New Text File](workflows/new-text-file/) | Creates a collision-safe `Untitled.txt` and opens it in the default editor. | Built-in tools |
| [Reveal in Terminal](workflows/reveal-in-terminal/) | Opens a Terminal window in each selected folder (or the parent of each file). | Built-in tools |
| [Copy File Path](https://github.com/pepperonas/macos-workflows/tree/main/workflows/copy-file-path) | Copies the full path of selected file(s) to the clipboard. | None |
| [Copy Metadata](https://github.com/pepperonas/macos-workflows/tree/main/workflows/copy-metadata) | Copies file metadata (type, size, dates, image dimensions) to the clipboard. | None |
| [Copy Folder Tree](https://github.com/pepperonas/macos-workflows/tree/main/workflows/copy-folder-tree) | Copies the folder structure as a text tree to the clipboard. | optional: `tree` (Homebrew) |
| [New Textfile](https://github.com/pepperonas/macos-workflows/tree/main/workflows/new-textfile) | Creates `Untitled.txt` in the current folder and opens it in the default editor. | None |
| [File Tools](https://github.com/hexdrx/awesome-quick-actions/tree/main/FileTools) | One menu for any file/folder: copy path (POSIX / file:// / name), checksum (SHA-256/1, MD5, verify), new file, batch rename. | None |
| [Share with LocalSend](https://github.com/shadow1363/automator-quick-actions/tree/main/Share%20with%20LocalSend.workflow) | Opens the selected file/folder with LocalSend, ready to send. | LocalSend |
| [Number Images Sequentially](https://github.com/karl-horning/macos-automator-workflows/tree/main/workflows/images/number-images-sequentially) | Renames selected images to `IMG_0001` format for consistent sequencing. | None |
| [Reverse Image File Names](https://github.com/karl-horning/macos-automator-workflows/tree/main/workflows/images/reverse-image-file-names) | Reverses the numbering of an image sequence. | None |
| [Copy Path (Quoted)](https://github.com/nikolarhristov/quickaction/tree/Current/Copy%20Path%20%28Quoted%29.workflow) | Copies shell-safe, `printf %q`-quoted absolute paths to the clipboard. | None (runs under zsh) |
| [Copy Path (URL)](https://github.com/nikolarhristov/quickaction/tree/Current/Copy%20Path%20%28URL%29.workflow) | Copies percent-encoded `file://` paths to the clipboard. | None (runs under zsh) |
| [ZFS Previous Versions](https://github.com/ljrnbg/zfs-previous-versions-macos) | Browse and safely restore previous file versions from TrueNAS/ZFS snapshots; a macOS take on Windows Previous Versions. | ZFS/TrueNAS snapshot share |
| [Add YYYY-MM-DD Prefix](https://github.com/yeutterg/automator-workflows/tree/master/Workflows/Add%20YYYY-MM-DD%20Prefix.workflow) | Adds today's date in `YYYY-MM-DD` format as a prefix to selected names. | None |
| [Rename Selected Files](https://github.com/sparanoid/automator-workflows/tree/master/Rename%20Selected%20Files.workflow) | Renames selected files via the standard Finder rename dialog. | None |

## Compression & Archives

| Action | Description | Requirements |
|---|---|---|
| [Unzip Here](workflows/unzip-here/) | Extracts each `.zip` into a collision-safe subfolder; skips `__MACOSX` metadata. | Built-in tools |
| [Zip Clean](workflows/zip-clean/) | Creates junk-free `.zip` archives (no `__MACOSX`, no `.DS_Store`); collision-safe names. | Built-in tools |
| [ZIP](https://github.com/hexdrx/awesome-quick-actions/tree/main/ZIP) | Zips file(s)/folder(s); prompts for one archive name on multi-select; strips `__MACOSX` and `.DS_Store`, never overwrites. | Built-in tools (`zip`) |
| [Brotli File](https://github.com/cheeaun/macos-quick-actions/tree/main/scripts/Brotli%20file.workflow) | Creates a `.br` compressed copy of a selected file. | optional: brotli (Homebrew) |
| [Gzip File](https://github.com/cheeaun/macos-quick-actions/tree/main/scripts/Gzip%20file.workflow) | Creates a `.gz` compressed copy of a selected file. | Built-in tools (`gzip`) |
| [Compress With Password](https://github.com/robinperson/compress-with-password) | Creates a password-protected ZIP from the Finder selection via the Quick Actions menu. | None |

## Developer Tools

| Action | Description | Requirements |
|---|---|---|
| [Base64 Decode](workflows/base64-decode/) | Decodes base64 from the selected text to the clipboard; notifies if the input isn't valid base64. | Built-in tools |
| [Base64 Encode](workflows/base64-encode/) | Base64-encodes the selected text as a single line (no wrapping) to the clipboard. | Built-in tools |
| [Checksum SHA-256](workflows/checksum-sha256/) | Writes SHA-256 checksums to the clipboard in `shasum` format; verify mode checks a `.sha256` file against its file. | Built-in tools |
| [Generate UUID](workflows/generate-uuid/) | Generates a fresh UUID and copies it to the clipboard (no trailing newline). | Built-in tools |
| [JSON Prettify](workflows/json-prettify/) | Pretty-prints the selected JSON with indentation to the clipboard; notifies on invalid JSON. | Python 3 |
| [URL Decode](workflows/url-decode/) | Decodes percent-encoded text (treating `+` as space) to the clipboard. | Python 3 |
| [URL Encode](workflows/url-encode/) | Percent-encodes the selected text as UTF-8 to the clipboard. | Python 3 |
| [Cleanup Caches](https://github.com/pepperonas/macos-workflows/tree/main/workflows/cleanup-caches) | Frees disk space with a confirmation dialog: clears macOS/npm/Gradle caches, user logs, PM2 logs, runs `brew cleanup`; shows freed bytes. | None |
| [Sleep Check](https://github.com/pepperonas/macos-workflows/tree/main/workflows/sleepcheck) | Diagnoses why the Mac won't sleep: lists active power assertions and finds orphaned automation browsers, offering to kill them. | None |
| [LoC](https://github.com/pepperonas/macos-workflows/tree/main/workflows/loc) | Counts source-code lines in selected folder(s), skipping `.git`, `node_modules`, venvs, build output, and minified files. | None |
| [LoC Chart](https://github.com/pepperonas/macos-workflows/tree/main/workflows/loc-chart) | Same counting engine as LoC, but results appear as a floating HUD with an animated per-language bar chart. | optional: Xcode CLI Tools (chart panel) |
| [Open with VSCodium](https://github.com/shadow1363/automator-quick-actions/tree/main/Open%20with%20VSCodium.workflow) | Opens the selected folder in a new VSCodium window. | VSCodium with the `codium` CLI shim in PATH |
| [Open in VS Code](https://github.com/smarcsoft/utils/tree/main/Open%20vscode%20contextual%20Menu/Open%20in%20VS%20Code.workflow) | Adds a Finder contextual menu item to open the selection in Visual Studio Code. | VS Code with the `code` CLI in PATH |
| [Create .icns](https://github.com/sparanoid/automator-workflows/tree/master/Create%20.icns.workflow) | Creates a `.icns` file from a selected image using `iconutil`. | Xcode Command Line Tools |
| [Unpack .icns](https://github.com/sparanoid/automator-workflows/tree/master/Unpack%20.icns.workflow) | Unpacks a `.icns` file into an `.iconset` folder using `iconutil`. | Xcode Command Line Tools |
| [Create favicon.ico](https://github.com/sparanoid/automator-workflows/tree/master/Create%20favicon.ico.workflow) | Creates a `favicon.ico` (64x64 4x resource) from a selected PNG using ImageMagick. | optional: imagemagick (Homebrew) |
| [Create favicon.ico (multi-resource)](https://github.com/sparanoid/automator-workflows/tree/master/Create%20favicon.ico%20%28multi-resource%29.workflow) | Creates a multi-resource `favicon.ico` (64x64, 32x32, 16x16) from a selected PNG. | optional: imagemagick (Homebrew) |
| [Create DMG Image](https://github.com/sparanoid/automator-workflows/tree/master/Create%20DMG%20Image.workflow) | Creates a distributable cross-platform hybrid DMG from a selected directory with `hdiutil`; prompts for the volume name. | None |
| [Encode Selected Files Using Base64](https://github.com/sparanoid/automator-workflows/tree/master/Encode%20Selected%20Files%20using%20Base64.workflow) | Base64-encodes selected files for use in data URI schemes. | None |
| [Open with rmate](https://github.com/sparanoid/automator-workflows/tree/master/Open%20with%20rmate.workflow) | Opens the selected file with `rmate` (TextMate's remote editor helper). | rmate |

## Productivity

| Action | Description | Requirements |
|---|---|---|
| [QR Code](https://github.com/pepperonas/macos-workflows/tree/main/workflows/qr-code) | Generates a QR code PNG from the file contents (if text) or the file path. | Xcode CLI Tools, compiled via build.sh |
| [QR](https://github.com/hexdrx/awesome-quick-actions/tree/main/QR) | Decodes QR codes from images (text to clipboard, URLs open in browser); encodes text into a QR image. | Built-in tools (CoreImage + Vision) |
| [Get Definition](https://github.com/yeutterg/automator-workflows/tree/master/Workflows/Get%20Definition.workflow) | Opens Dictionary.app with the highlighted text as the query. | None |
| [Add to Alfred Blocklist](https://github.com/princelundgren/automator-collection/tree/master/Add%20to%20Alfred%20blocklist.workflow) | Adds the selected file to the Alfred blocklist directly from Finder. | Alfred |
| [Remove from Alfred Blocklist](https://github.com/princelundgren/automator-collection/tree/master/Remove%20from%20Alfred%20blocklist.workflow) | Removes the selected file from the Alfred blocklist directly from Finder. | Alfred |

## Screenshots & Clipboard

> A nod to the viral AI screenshot-renaming trend (Tiffany Kyazze's viral thread on auto-describing screenshots): [Rename Image via Description](workflows/rename-image-description/) is the human-in-the-loop version — a dialog pre-filled with the file's timestamp, you type a few words, and the screenshot gets a real name.

| Action | Description | Requirements |
|---|---|---|
| [Rename Image via Description](workflows/rename-image-description/) | Renames each selected image from a short description you type; never overwrites existing files. | Built-in tools |
| [OCR Screenshots to Note](https://github.com/justinburnette/screenshot-to-applenotes) | OCRs one or more screenshots and creates an Apple Note with the combined text. | None |

## Other Collections

Five flagship community repositories of macOS Quick Actions / Automator workflows, each worth browsing on its own:

| Collection | What's inside |
|---|---|
| [pepperonas/macos-workflows](https://github.com/pepperonas/macos-workflows) | 22 modern workflows: Apple Vision background removal, QR codes, sleep diagnostics, LoC counting, music-file renaming, and more. |
| [sparanoid/automator-workflows](https://github.com/sparanoid/automator-workflows) | 18 classic workflows: app iconsets, favicons, image compression, DMG creation, base64 encoding, text-to-audio. |
| [karl-horning/macos-automator-workflows](https://github.com/karl-horning/macos-automator-workflows) | 9 image and PDF workflows: flipping, rotating, scaling, sequential numbering, PDF splitting and creation. |
| [yeutterg/automator-workflows](https://github.com/yeutterg/automator-workflows) | 7 general-purpose workflows: PDF split/combine/text extraction, date-prefixed filenames, word counting, dictionary lookup. |
| [hexdrx/awesome-quick-actions](https://github.com/hexdrx/awesome-quick-actions) | 5 polished quick actions: a universal format converter, ZIP, a File Tools multi-menu, QR encode/decode, and on-device transcription. |

## License

MIT — see [LICENSE](LICENSE). Every bundled action in `workflows/` is MIT-licensed; external entries link to their own sources, so check their repos for license terms before redistributing.
