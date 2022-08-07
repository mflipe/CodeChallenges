//  Created by Marcos Rocha on 07/08/22.

/* MARK: - The Goal
 The program:
 Given a digit N, you must print a reverse pyramid with the base containing N times that digit.
 Each consecutive row containing 1 digit less.
 The result should contain no spaces.

 INPUT:
 Line 1: An integer N.

 OUTPUT:
 A triangle formed by N times the digit N one the first row, then one digit less per row.

 CONSTRAINTS:
 1 ≤ N ≤ 9

 EXAMPLE:
 Input
 2
 Output
 22
 2
 
 */// MARK: The Goal

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
func solution(_ input: String) -> [String] {
    var result: [String] = []
    for line in stride(from: Int(input)!, to: 0, by: -1) {
        result.append( String(repeating: input, count: line) )
    }
    return result
}

// MARK: - Test Cases

public class TestObserver: NSObject, XCTestObservation {
    public func testCase(_ testCase: XCTestCase,
                           didFailWithDescription description: String,
                           inFile filePath: String?,
                           atLine lineNumber: Int) {
        // print("1️⃣ failure description: \(description)")
        print("2️⃣ failed test case: \(testCase)")
        /*
        if let filePath = filePath {
            print("3️⃣ failure at file path: \(filePath)")
        }
        print("4️⃣ failure at line: \(lineNumber)")
        */
    }
}

class Tests: XCTestCase {

    var input: String = ""
    var output: [String] = []

    override class func setUp() {
        super.setUp()
        // XCTestObservationCenter.shared.addTestObserver(TestObserver())
    }

    override class func tearDown() {
        super.tearDown()
    }

    override func setUp() {
        super.setUp()
        print("\n⬇️ Debug ----------")
    }

    override func tearDown() {
        super.tearDown()
        print("⬆️ Debug ----------")

        guard let count = testRun?.failureCount else { return }

        if count == 0 {
            print("Result: ✅ Success\n")
        } else {
            print("Result: 🔴 Failed\n")
        }
    }

    func test1() {
        input = "2"
        output = [
            "22",
            "2"
        ]
        XCTAssertEqual(solution(input), output)
    }

    func test2() {
        input = "3"
        output = [
            "333",
            "33",
            "3"
        ]
        XCTAssertEqual(solution(input), output)
    }

    func test3() {
        input = "4"
        output = [
            "4444",
            "444",
            "44",
            "4"
        ]
        XCTAssertEqual(solution(input), output)
    }

    func test4() {
        input = "5"
        output = [
            "55555",
            "5555",
            "555",
            "55",
            "5"
        ]
        XCTAssertEqual(solution(input), output)
    }

    func test5() {
        input = "6"
        output = [
            "666666",
            "66666",
            "6666",
            "666",
            "66",
            "6"
        ]
        XCTAssertEqual(solution(input), output)
    }

    func test6() {
        input = "7"
        output = [
            "7777777",
            "777777",
            "77777",
            "7777",
            "777",
            "77",
            "7"
        ]
        XCTAssertEqual(solution(input), output)
    }
}

Tests.defaultTestSuite.run()
