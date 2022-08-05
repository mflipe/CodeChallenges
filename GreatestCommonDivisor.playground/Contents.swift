//  Created by MacMini-16G on 03/08/22.

/* MARK: - The Goal
 
The program:
Your program must find the greatest common divisor for two integers.

The greatest common divisor of two integers is the largest positive integer that divides the numbers without
 a remainder.

INPUT:
Two integer numbers separated by a whitespace, a and b.

OUTPUT:
The greatest common divisor of a and b.

CONSTRAINTS:
0 < a,b ≤ 1000000

EXAMPLE:
Input
169 104
Output
13

 */// MARK: The Goal

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
// Executed 6 tests, with 0 failures (0 unexpected) in 0.632 (0.634) seconds
/*
func solution(_ input: [String]) -> Int {
    var a = Int(input[0])!
    var b = Int(input[1])!
    
    while a != b {
        if a > b {
            a = a - b
        } else {
            b = b - a
        }
    }
    
    return a
}
 */

// MARK: - Solution 2
// Executed 6 tests, with 0 failures (0 unexpected) in 0.024 (0.026) seconds
/*
func solution(_ input: [String]) -> Int {
    
    let m = Int(input[0])!
    let n = Int(input[1])!
    
    var a: Int = 0
    var b: Int = max(m, n)
    var r: Int = min(m, n)
    
    while r != 0 {
        a = b
        b = r
        r = a % b
    }
    
    return b
}
 */

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
    var output: Int = 0

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
        input = ["169", "104"]
        output = 13
        XCTAssertEqual(solution(input), output)
    }

    func test2() {
        input = ["100", "250"]
        output = 50
        XCTAssertEqual(solution(input), output)
    }

    func test3() {
        input = ["1", "1"]
        output = 1
        XCTAssertEqual(solution(input), output)
    }

    func test4() {
        input = ["1000000", "5"]
        output = 5
        XCTAssertEqual(solution(input), output)
    }

    func test5() {
        input = ["104711", "104717"]
        output = 1
        XCTAssertEqual(solution(input), output)
    }
    
    func test6() {
        input = ["98304", "65536"]
        output = 32768
        XCTAssertEqual(solution(input), output)
    }

}

Tests.defaultTestSuite.run()
