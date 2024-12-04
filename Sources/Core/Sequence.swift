import Foundation

public extension Sequence where Element: Numeric {

    var sum: Element {
        reduce(0, +)
    }
}
