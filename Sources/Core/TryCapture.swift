import Foundation
import RegexBuilder

public extension TryCapture where Output == (Substring, Int) {

    static var integer: Self {
        TryCapture {
            OneOrMore { .digit }
        } transform: {
            Int($0)
        }
    }
}
