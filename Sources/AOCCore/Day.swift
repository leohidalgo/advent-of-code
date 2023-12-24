import Foundation

public protocol Day { 

    associatedtype PartOne
    associatedtype PartTwo

    func partOne() -> PartOne
    func partTwo() -> PartTwo
}

// MARK: -

public extension Day {

    func input(_ file: StaticString = #file) -> Input {
        do {
            return try Input.makeInput(caller: file)
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func run() -> (PartOne, PartTwo) {
        (partOne(), partTwo())
    }
}
