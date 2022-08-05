//
//  Created by MacMini-8G on 20/07/22.
//

/* MARK: - The Goal
 You should calculate the value of material on the chessboard for both sides black and white. Relying on that deep and
 solid analysis, output who is better.

 White pieces represented as uppercase letters, black pieces as lowercase letters (P/p for pawns, N/n for knights, B/b
 for bishops, R/r for rooks, Q/q for queens, K/k for kings). Blank squares shown as spaces and dots.

 ~ [P]awn cost 1 point.
 ~ k[N]ight or [B]ishop cost 3 points.
 ~ [R]ook cost 5 points.
 ~ [Q]ueen cost 9 points.
 ~ [K]ing cost nothing.
 
 Input
 Next 8 lines: Collection of strings describing position on the board. Each line reveals eight squares in a row.
 Output
 Single line: message "white is better", "black is better" or "equal", overall value of material for white and
 value for black, all separated by spaces.
 
 */// MARK: The Goal

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
func solution(_ input: [String]) -> String {
    let values: [String: Int] = ["P": 1, "N": 3, "B": 3, "R": 5, "Q": 9, "K": 0]
    var result: [Int] = [0, 0]

    for line in input {
        let white = line.filter { $0.isUppercase && $0 != " " }
        let black = line.filter { !$0.isUppercase && $0 != "." && $0 != " "}

            result[0] += white.reduce(into: 0) { acc, value in
                acc += values.keys.contains(String(value)) ? values[String(value)]! : 0
            }
            result[1] += black.reduce(into: 0) { acc, value in
                acc += values.keys.contains(String(value).uppercased()) ? values[String(value).uppercased()]! : 0
            }
    }

    if result[0] == result[1] {
        return "equal \(result[0]) \(result[1])"
    }

    if result[0] > result[1] {
        return "white is better \(result[0]) \(result[1])"
    }

    return "black is better \(result[0]) \(result[1])"
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

    var input: [String] = []
    var output: String = ""

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
        input = [" . . . .",
                 "p . . . ",
                 " . . . .",
                 ". . . . ",
                 " . . . .",
                 ". . . . ",
                 " . . . .",
                 ". . . . "]
        output = "black is better 0 1"
        XCTAssertEqual(solution(input), output)
    }

    func test2() {
        input = [" . . . .",
                 "p . . . ",
                 " . . . .",
                 ". . . . ",
                 " . . . .",
                 ". . . . ",
                 " .P. P .",
                 ". . . . "]
        output = "white is better 2 1"
        XCTAssertEqual(solution(input), output)
    }

    func test3() {
        input = [" . . . .",
                 ". . . . ",
                 " . . . .",
                 ". . p . ",
                 " . . . .",
                 ". .b. . ",
                 " . . . .",
                 ". . N . "]
        output = "black is better 3 4"
        XCTAssertEqual(solution(input), output)
    }

    func test4() {
        input = [
           " .r. . .",
           ". . . pp",
           " . . . .",
           ". . . . ",
           " . . . .",
           ". . . . ",
           " . . . .",
           "R . . .R"
        ]
        output = "white is better 10 7"
        XCTAssertEqual(solution(input), output)
    }

    func test5() {
        input = [
           " .Q. . .",
           ". . . . ",
           " . . . .",
           ". .b. . ",
           " . b . .",
           ". . . . ",
           " . . .p.",
           ". . . . "
        ]
        output = "white is better 9 7"
        XCTAssertEqual(solution(input), output)
    }

    func test6() {
        input = [
            "rnbqkbnr",
            "pppppppp",
            " . . . .",
            ". . . . ",
            " . . . .",
            ". . . . ",
            "PPPPPPPP",
            "RNBQKBNR"
        ]
        output = "equal 39 39"
        XCTAssertEqual(solution(input), output)
    }

    func test7() {
        input = [
            "r. . k .",
            "p .p. . ",
            "qb . p .",
            ". . . . ",
            " . . . .",
            "P . . . ",
            " P . PPP",
            "R .Q.RK "
        ]
        output = "white is better 24 20"
        XCTAssertEqual(solution(input), output)
    }

    func test8() {
        input = [
           " . R .k.",
           ". . .ppp",
           "p. . . .",
           ".p. . . ",
           " n . . .",
           ". . . . ",
           " . . . .",
           ". . .k. "
        ]
        output = "black is better 5 8"
        XCTAssertEqual(solution(input), output)
    }

}

Tests.defaultTestSuite.run()

print("END")
