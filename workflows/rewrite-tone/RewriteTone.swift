import Foundation
import FoundationModels

func eprint(_ message: String) { fputs(message + "\n", stderr) }

@main
struct RewriteTone {
    static func main() async {
        guard #available(macOS 26, *) else {
            eprint("Rewrite in Chosen Tone requires macOS 26 or later (Foundation Models framework).")
            exit(2)
        }
        let tone = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "Professional"
        let instructions: String
        switch tone.lowercased() {
        case "friendly":
            instructions = "Rewrite the text in a warm, friendly tone. Fix grammar. Keep the meaning."
        case "concise":
            instructions = "Rewrite the text as concisely as possible without losing any meaning."
        default:
            instructions = "Rewrite the text in a clear professional tone. Fix grammar. Keep the meaning."
        }

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
            eprint("Rewrite failed: \(error.localizedDescription)")
            exit(1)
        }
    }
}
