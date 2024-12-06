import Foundation

extension Collection where Element: Hashable {

    public var allDifferent: Bool { Set(self).count == count }

    public var allSame: Bool { Set(self).count == 1 }
}
