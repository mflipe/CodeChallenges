//  Created by Marcos Rocha on 07/08/2022.

/* MARK: - The Goal
Output the (signed) size of the range [ N, 1000-N ]
Input
The integer N
Output
one integer
Constraints
0 ≤ N ≤ 1000
Example
Input
15
Output
970
 
 */// MARK: The Goal

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
func solution(_ input: String) -> Int {
    let number1 = Int(input)!
    let number2 = 1000 - number1
    let result = ( min(number1, number2)..<max(number1, number2) ).count

    return number2 > number1 ? result : -result
}

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
        input = "15"
        output = 970
        XCTAssertEqual(solution(input), output)
    }

    func test2() {
       input = "685"
       output = -370
       XCTAssertEqual(solution(input), output)
    }

    func test3() {
      input = "350"
      output = 300
      XCTAssertEqual(solution(input), output)
    }
}

Tests.defaultTestSuite.run()
