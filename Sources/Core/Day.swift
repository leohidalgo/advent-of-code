import Foundation

public protocol Day {

    associatedtype Part1: CustomStringConvertible = String
    associatedtype Part2: CustomStringConvertible = String

    func part1() -> Part1
    func part2() -> Part2
}
