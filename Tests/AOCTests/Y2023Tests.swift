import XCTest

@testable import AOC2023

final class Y2023Tests: XCTestCase { 

    func testDay1() {
        let (p1, p2) = Day1().run()

        XCTAssertEqual(p1, 123)
        XCTAssertEqual(p2, 123)
    }
}
