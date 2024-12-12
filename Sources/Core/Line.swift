import Foundation

public final class Line: StringInput {

    public lazy var characters: [Character] = { Array(raw) }()
    public lazy var integers: [Int] = { raw.components(separatedBy: .wordSeparator).compactMap { Int($0) } }()
    public lazy var lines: [Line] = { [self] }()
    public lazy var trimmed: Line = { Line(raw.trimmingCharacters(in: .whitespacesAndNewlines)) }()

    public var raw: String

    init(_ raw: String) {
        self.raw = raw
    }
}
