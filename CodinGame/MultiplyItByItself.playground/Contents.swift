//  Created by MacMini-16G on 04/08/22.

/* MARK: - The Goal
Given a number you must multiply it by itself and all numbers below it and return the total sum of each multiplication.

Example 1:
Input = 5
5*5+5*4+5*3+5*2+5*1=75
return 75

Example 2:
Input = 3
3*3+3*2+3*1=18
return 18

Input
Line 1: An integer N as the number to use to multiply.
Output
Line 1: An integer.
Constraints
0 ≤ N ≤ 9999
Example
Input
4
Output
40

 */// MARK: The Goal

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
func solution(_ input: String) -> Int {
    let input = Int(input)!

    let result = stride(from: input, to: 0, by: -1).reduce(into: 0) { acumulado, valor in
        acumulado += valor * input
    }
    return result
}

// MARK: - Solution 2

// MARK: - Test Cases
class Tests: XCTestCase {

    var input: String = ""
    var output: Int = 0

    override class func setUp() {
        super.setUp()
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
        input = "4"
        output = 40
        XCTAssertEqual(solution(input), output)
    }

    func test2() {
        input = "5"
        output = 75
        XCTAssertEqual(solution(input), output)
    }

    func test3() {
        input = "15"
        output = 1800
        XCTAssertEqual(solution(input), output)
    }

    func test4() {
        input = "58"
        output = 99238
        XCTAssertEqual(
            solution(input),
            output)
    }

    func test5() {
        input = "502"
        output = 63379006
        XCTAssertEqual(solution(input), output)
    }

    func test6() {
        input = "0"
        output = 0
        XCTAssertEqual(solution(input), output)
    }

    func test7() {
        input = "5210"
        output = 70723952550
        XCTAssertEqual(solution(input), output)
    }

}

Tests.defaultTestSuite.run()
