import Foundation
import NaturalLanguage

@main
struct RedactPII {
    static func main() {
        let input = String(data: FileHandle.standardInput.readDataToEndOfFile(), encoding: .utf8) ?? ""
        guard !input.isEmpty else { exit(0) }

        var spans: [(range: NSRange, label: String)] = []

        // 1. On-device named-entity recognition (names, places, organizations).
        let tagger = NLTagger(tagSchemes: [.nameType])
        tagger.string = input
        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
        tagger.enumerateTags(in: input.startIndex..<input.endIndex, unit: .word, scheme: .nameType, options: options) { tag, tokenRange in
            if let tag = tag {
                let label: String?
                switch tag {
                case .personalName: label = "NAME"
                case .placeName: label = "PLACE"
                case .organizationName: label = "ORG"
                default: label = nil
                }
                if let label = label {
                    spans.append((NSRange(tokenRange, in: input), label))
                }
            }
            return true
        }

        // 2. Regex for structured PII the NER model does not cover.
        let nsInput = input as NSString
        let patterns: [(String, String)] = [
            ("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", "EMAIL"),
            ("\\b\\d{3}[-.\\s]?\\d{3}[-.\\s]?\\d{4}\\b", "PHONE"),
            ("\\b\\d{3}-\\d{2}-\\d{4}\\b", "SSN"),
        ]
        for (pattern, label) in patterns {
            if let regex = try? NSRegularExpression(pattern: pattern) {
                for match in regex.matches(in: input, range: NSRange(location: 0, length: nsInput.length)) {
                    spans.append((match.range, label))
                }
            }
        }

        // 3. Merge overlapping spans, then redact back-to-front so ranges stay valid.
        let sorted = spans.sorted { $0.range.location < $1.range.location }
        var merged: [(range: NSRange, label: String)] = []
        for span in sorted {
            if let last = merged.last, NSIntersectionRange(last.range, span.range).length > 0 {
                continue
            }
            merged.append(span)
        }
        let result = NSMutableString(string: input)
        for span in merged.reversed() {
            result.replaceCharacters(in: span.range, with: "[\(span.label)]")
        }
        print(result as String)
    }
}
