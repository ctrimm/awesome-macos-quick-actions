import Foundation
import FoundationModels

func eprint(_ message: String) { fputs(message + "\n", stderr) }

@main
struct GenerateCommitMessage {
    static func main() async {
        guard #available(macOS 26, *) else {
            eprint("Generate Commit Message requires macOS 26 or later (Foundation Models framework).")
            exit(2)
        }
        let instructions = "Write a conventional-commit message for this git diff. First line: <type>: <subject> using one of feat, fix, docs, style, refactor, test, chore; imperative mood; max 72 characters. Then a blank line and a one- or two-sentence body only if the change needs explanation. Output only the commit message, no preamble."

        let input = String(data: FileHandle.standardInput.readDataToEndOfFile(), encoding: .utf8) ?? ""
        let text = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { exit(0) }

        let availability = SystemLanguageModel.default.availability
        guard case .available = availability else {
            eprint("Apple Intelligence is not available (\(availability)). Enable it in System Settings > Apple Intelligence & Siri.")
            exit(3)
        }

        do {
            let session = LanguageModelSession(instructions: instructions)
            let response = try await session.respond(to: text)
            print(response.content)
        } catch {
            eprint("Commit message generation failed: \(error.localizedDescription)")
            exit(1)
        }
    }
}
