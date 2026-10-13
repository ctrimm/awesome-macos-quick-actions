import Foundation
import FoundationModels

func eprint(_ message: String) { fputs(message + "\n", stderr) }

@main
struct SmartRenameFile {
    static func main() async {
        guard #available(macOS 26, *) else {
            eprint("Smart Rename File requires macOS 26 or later (Foundation Models framework).")
            exit(2)
        }
        let paths = CommandLine.arguments.dropFirst()
        guard !paths.isEmpty else { exit(0) }

        let availability = SystemLanguageModel.default.availability
        guard case .available = availability else {
            eprint("Apple Intelligence is not available (\(availability)). Enable it in System Settings > Apple Intelligence & Siri.")
            exit(3)
        }

        for path in paths {
            let url = URL(fileURLWithPath: path)
            let folder = url.deletingLastPathComponent().lastPathComponent
            let prompt = """
                Propose a short, descriptive filename for a file currently named "\(url.lastPathComponent)" \
                in a folder named "\(folder)".
                Rules: lowercase, words separated by hyphens, filesystem-safe (letters, numbers, hyphens only), \
                at most 60 characters, no file extension.
                Reply with ONLY the filename, nothing else.
                """
            do {
                let session = LanguageModelSession()
                let response = try await session.respond(to: prompt)
                let name = response.content.trimmingCharacters(in: .whitespacesAndNewlines)
                print("\(path)\t\(name)")
            } catch {
                eprint("Rename suggestion failed for \(path): \(error.localizedDescription)")
            }
        }
    }
}
