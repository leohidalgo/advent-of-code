import Foundation

public protocol StringInput {

    var characters: [Character] { get }
    var lines: [Line] { get }
    var trimmed: Self { get }
}
