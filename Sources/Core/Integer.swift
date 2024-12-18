import Foundation

public extension Int {

    var isEven: Bool {
        self % 2 == 0
    }

    var signum: Int {
        signum()
    }

    init?(_ character: Character) {
        guard
            character.isNumber
        else { return nil }

        switch character {
            case "0": self = 0
            case "1": self = 1
            case "2": self = 2
            case "3": self = 3
            case "4": self = 4
            case "5": self = 5
            case "6": self = 6
            case "7": self = 7
            case "8": self = 8
            case "9": self = 9
            default: return nil
        }
    }
}
