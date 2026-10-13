import Foundation
import NaturalLanguage

@main
struct ListEntities {
    static func main() {
        let input = String(data: FileHandle.standardInput.readDataToEndOfFile(), encoding: .utf8) ?? ""
        let text = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { exit(0) }

        var people: [String] = [], places: [String] = [], orgs: [String] = []
        let tagger = NLTagger(tagSchemes: [.nameType])
        tagger.string = input
        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
        tagger.enumerateTags(in: input.startIndex..<input.endIndex, unit: .word, scheme: .nameType, options: options) { tag, tokenRange in
            let token = String(input[tokenRange])
            switch tag {
            case .personalName: people.append(token)
            case .placeName: places.append(token)
            case .organizationName: orgs.append(token)
            default: break
            }
            return true
        }
        func dedupe(_ xs: [String]) -> [String] {
            var seen = Set<String>()
            return xs.filter { seen.insert($0).inserted }
        }
        var lines: [String] = []
        let p = dedupe(people), l = dedupe(places), o = dedupe(orgs)
        if !p.isEmpty { lines.append("People: " + p.joined(separator: ", ")) }
        if !l.isEmpty { lines.append("Places: " + l.joined(separator: ", ")) }
        if !o.isEmpty { lines.append("Organizations: " + o.joined(separator: ", ")) }
        if lines.isEmpty {
            print("No named entities found.")
        } else {
            print(lines.joined(separator: "\n"))
        }
    }
}
