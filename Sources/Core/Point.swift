import Foundation

public struct Point: Hashable {
    public let row: Int
    public let col: Int

    public init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }
}

extension Point: CustomDebugStringConvertible {

    public var debugDescription: String {
        "(\(row), \(col))"
    }
}
