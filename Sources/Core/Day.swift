import Foundation

public protocol Day {

    associatedtype Part1: CustomStringConvertible = String
    associatedtype Part2: CustomStringConvertible = String

    var rawInput: String? { get }

    func part1() -> Part1
    func part2() -> Part2
}

public extension Day {

    var rawInput: String? { nil }

    func input(filePath: StaticString = #filePath) -> Input {
        if let rawInput = rawInput {
            return Input(rawInput)
        }

        return Input.makeInput(caller: filePath)
    }
}
