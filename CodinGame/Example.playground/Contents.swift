//  Created by MacMini-8G on 14/07/22.

/* MARK: - The Goal
 
 */// MARK: The Goal

/* MARK: - Default Code

 */// MARK: Default Code

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
func solution() {}

// MARK: - Solution 2

// MARK: - Test Cases
class Tests: XCTestCase {

    var input1: String = ""
    var input2: String = ""
    var output: Int = 0
    var myReport: String = ""

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
        input1 = "4 4 3 4 4 5 4 3 5 4 3 4 5 4 4 3 4 5"
        input2 = "4 3 2 4 3 4 3 3 4 4 3 4 6 4 5 3 3 4"
        output = -6
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test2() {
        input1 = "4 4 3 5 3 4 5 4 4 4 5 3 4 4 5 4 3 5"
        input2 = "6 4 3 5 3 4 4 5 6 5 6 4 5 4 4 5 3 4"
        output = 7
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test3() {
        input1 = "5 4 3 4 4 4 4 3 5 5 4 4 3 4 4 4 3 5"
        input2 = "6 5 4 4 4 4 4 3 5 5 4 4 3 4 4 4 3 6"
        output = 4
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test4() {
        input1 = "4 4 4 5 4 3 4 3 4 4 4 5 3 4 4 4 3 4"
        input2 = "4 4 4 4 4 4 4 3 5 4 4 5 3 5 4 3 2 3"
        output = -1
        XCTAssertEqual(
            solution(input1, input2),
            output)
    }

    func test5() {
        input1 = "5 4 3 4 4 4 4 3 5 5 4 4 3 4 4 4 3 5"
        input2 = "5 3 3 4 4 3 4 3 4 5 3 4 3 5 3 3 4 4"
        output = -5
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test6() {
        input1 = "4 4 3 5 3 4 5 4 4 4 5 3 4 4 5 4 3 5"
        input2 = "3 4 2 5 3 5 4 5 4 3 5 3 5 4 4 4 7 3"
        output = 0
        XCTAssertEqual(solution(input1, input2), output)
    }

}

Tests.defaultTestSuite.run()
