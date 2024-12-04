import Foundation

public final class Input: StringInput {

    public lazy var characters: [Character] = { Array(raw) }()
    public lazy var integers: [Int] = { raw.components(separatedBy: .whitespaces).compactMap { Int($0) }  }()
    public lazy var lines: [Line] = { raw.components(separatedBy: .newlines).map { Line($0) } }()
    public lazy var trimmed: Input = { Input(raw.trimmingCharacters(in: .whitespacesAndNewlines)) }()

    private var raw: String

    init(_ raw: String) {
        self.raw = raw
    }
}

extension Input {

    static func makeInput(caller: StaticString) -> Input {
        var path = caller.description.split(separator: "/")
        path.removeLast()
        path.append("input.txt")

        let inputPath = "/" + path.joined(separator: "/")
        if FileManager.default.fileExists(atPath: inputPath),
            let raw = try? String(contentsOfFile: inputPath, encoding: .utf8).trimmingCharacters(in: .newlines) {

            return .init(raw)
        }

        return .init("")
    }
}
