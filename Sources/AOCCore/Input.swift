import Foundation

public class Input { 

    // MARK: Public Property

    public var raw: String

    public lazy var lines: [String] = {
        raw.trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
    }()

    // MARK: Initialization

    init(raw: String) {
        self.raw = raw
    }

    convenience init(file: String) throws {
        let raw = try String(contentsOfFile: file)

        self.init(raw: raw)
    }

    // MARK: Public Static Methods

    public static func makeInput(caller: StaticString) throws -> Input {
        var inputPathComponents = caller.description.components(separatedBy: "/")
        inputPathComponents.removeLast()
        inputPathComponents.append("input.txt")

        return try Input(file: inputPathComponents.joined(separator: "/"))
    }
}
