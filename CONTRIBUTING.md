# Contributing

Thanks for wanting to add a Quick Action! This guide covers how to contribute a new bundled action or a new external link.

## Adding a bundled action

A bundled action lives in this repo so anyone can install it with a double-click. The layout is:

```
workflows/<slug>/
  <Name>.workflow/
    Contents/
      document.wflow   # the Automator workflow XML
      Info.plist       # must be a valid plist
  README.md            # one paragraph describing the action
```

- **Build it in Automator.** Save the workflow as an Application or Quick Action, then copy the `.workflow` bundle into `workflows/<slug>/` with the name matching the action's display name (e.g. `workflows/resize-image/Resize Image.workflow/`).
- **The plist must be valid.** Check with `plutil -lint "workflows/<slug>/<Name>.workflow/Contents/Info.plist"` — it must report OK. Automator-generated plists usually are; hand-edited ones often aren't.
- **Write a one-paragraph README.md** in `workflows/<slug>/`. Say what the action does, what input it expects (files, folders, selected text), whether it modifies originals or writes copies next to them, and list its requirements. If the action needs a third-party tool, it must degrade gracefully (a dialog explaining the install, e.g. `brew install ffmpeg`) instead of failing silently.
- **No destructive actions.** An action must never modify originals in place — write new files next to the original with collision-safe names, or put results on the clipboard. Never rename, move, or delete without an explicit confirmation dialog.
- **MIT-licensed only.** By submitting, you agree the action is released under this repo's MIT license. Do not submit actions derived from non-MIT-compatible sources.
- **Categories.** Pick the best fit from: Apple Intelligence (On-Device), Images, Audio & Video, PDFs, Text, Files & Folders, Compression & Archives, Developer Tools, Productivity, Screenshots & Clipboard. Don't invent a new category without discussing it first.
- **Keep dependencies optional and clearly marked.** Prefer macOS built-in tools (`sips`, `ffmpeg`-free fallbacks, Python 3 standard library). If an optional tool is required for full functionality, say so in the README and in the main README's Requirements column.

### Swift-based actions (on-device AI pattern)

Actions in the Apple Intelligence section ship Swift source instead of just shell. Follow this pattern:

```
workflows/<slug>/
  <Name>.workflow/
    Contents/
      document.wflow   # shell action: finds the helper binary, or shows a "run ./build.sh" dialog
      Info.plist
      Resources/
        <HelperName>.swift
        build.sh       # compiles <HelperName>.swift into Resources/, executable
  README.md
```

- Keep the Swift minimal: one file, stdlib + one framework (FoundationModels, Translation, Vision, NaturalLanguage). Print results to stdout.
- `build.sh` must be executable and idempotent; compile with `swiftc` from the Xcode Command Line Tools.
- The shell action must never fail silently: if the helper binary is missing, show a dialog telling the user to run `./build.sh` once.
- Requirements column values: `macOS 26+ (Foundation Models)` for Apple Intelligence actions, `macOS 15+ (language packs)` for Translation, the framework's real minimum otherwise — and `Xcode CLI Tools (one-time build)` wherever Swift is used.

## Adding an external link

Not every action belongs as a bundle — maybe it's maintained elsewhere and updated often. To add a curated link, open a PR editing `README.md` with a new table row under the right category:

- **Action:** the action's name, linked to the workflow's page (the `.workflow` folder or its repo tree path, not the repo root).
- **Description:** one line, plain words — what it does and whether it modifies originals.
- **Requirements:** `None`, `Built-in tools`, or the dependency with an `optional:` prefix when there's a graceful fallback (e.g. `optional: ffmpeg`).

The link must be reachable and the action must be free and installable on a stock Mac plus its stated requirements.

## Submitting

1. Fork the repo, create a branch, make your change.
2. For bundles: run the verification — every `workflows/<slug>/` folder must exist and every link in the README must resolve.
3. Open a pull request describing what the action does and confirming it was tested on a real Mac.

Small, focused PRs (one action each) are easiest to review.
