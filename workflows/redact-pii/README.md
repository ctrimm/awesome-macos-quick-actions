# Redact PII from Text

Scans the selected text for personally identifying information — personal/place/organization names via on-device NaturalLanguage NER, plus emails, phone numbers, and SSNs via patterns — and replaces each with a labeled placeholder ([NAME], [EMAIL], [PHONE], [SSN], …). Nothing leaves your Mac, which is the whole point: safe to run on sensitive text.

Fully on-device: nothing you select is ever uploaded to any server.

Requirements: macOS 12+; Xcode Command Line Tools — run `./build.sh` in this folder once to compile the helper.

Build: run `./build.sh` in this folder once (needs the Xcode Command Line Tools), then double-click the `.workflow` file to install. If macOS quarantines the helper, run `xattr -dr com.apple.quarantine "<Name>.workflow"`.

How it works: Pipes the selected text to a Swift helper combining `NLTagger` (`.nameType` scheme) with regular expressions, merging overlapping spans before redacting.
Note: these bundles were authored on Linux and have not yet been compiled or run on a Mac — Mac-tested confirmation is welcome.
