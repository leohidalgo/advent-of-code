import Foundation

extension Collection where Element: Hashable {

    public var allSame: Bool { Set(self).count == 1 }
}
