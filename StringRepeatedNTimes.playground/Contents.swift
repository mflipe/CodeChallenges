//  Created by MacMini-8G on 14/07/22.

/* MARK: - The Goal
 Repeat the given string N times and output the result to the console
 
 Input:
 lines 1:N - number of times to repeat
 lines 2: the line to be repeated
 
 Output:
 string repeated N times, but if N=0 output 'empty'
 
 Constraints:
 0<=N<=10
 1<=string length <=10
 
 Example:
 Input:
 1
 string
 Output:  string
 
 
 */// MARK: The Goal

/* MARK: - Default Code

 */// MARK: Default Code

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
func solution(_ input: String, _ count: Int) -> String {
    return String(repeating: input, count: count)
}

// MARK: - Solution 2

// MARK: - Test Cases
class Tests: XCTestCase {

    var count: Int = 0
    var input: String = ""
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
        count = 1
        input = "String"
        output = "String"
        XCTAssertEqual(solution(input, count), output)
    }

    func test2() {
        count = 2
        input = "aa"
        output = "aaaa"
        XCTAssertEqual(solution(input, count), output)
    }
    
    func test3() {
        count = 5
        input = "Array(10)"
        output = "Array(10)Array(10)Array(10)Array(10)Array(10)"
        XCTAssertEqual(solution(input, count), output)
    }
    
    func test4() {
        count = 0
        input = "seventeen"
        output = ""
        XCTAssertEqual(solution(input, count), output)
    }
    
    func testPerformance() {
        measure {
            test1()
            test2()
            test3()
            test4()
        }
    }
}

Tests.defaultTestSuite.run()
