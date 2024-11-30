import Core
import XCTest

@testable import Year2023

final class Year2023Tests: XCTestCase {

    func testDay1() throws {
        let sut = Day1()

        XCTAssertEqual(sut.part1(), 0)
        XCTAssertEqual(sut.part2(), 0)
    }
}
