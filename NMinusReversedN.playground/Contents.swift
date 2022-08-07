//  Created by MacMini-8G on 14/07/22.

/* MARK: - The Goal
 Given a number N, print N minus N where all digits have been reversed.

 2 -> (reversed) 2 -> 2-2 = 0
 57-> (reversed) 75 -> 57-75 = -18
 Input
 Line 1: An integer N
 Output
 Line 1: N minus N where all digits have been reversed.
 Constraints
 0 ≤ N ≤ 10000
 Example
 Input
 7
 Output
 0
 
 */// MARK: The Goal

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
func solution(_ input: String) -> Int {
    let number = input
    let reversedNumber = String(number.reversed())
    return Int(number)! - Int(reversedNumber)!
}

// MARK: - Test Cases

/*
 Found: 7
 Expected: 0
 
 Found: 13
 Expected: -18
 
 Found: 1751
 Expected: 180
 
 Found: 9030
 Expected: 8721
 
 */

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
        input = "7"
        output = 0
        XCTAssertEqual(solution(input), output)
    }

    func test2() {
        input = "13"
        output = -18
        XCTAssertEqual(solution(input), output)
    }

    func test3() {
        input = "1751"
        output = 180
        XCTAssertEqual(solution(input), output)
    }

    func test4() {
        input = "9030"
        output = 8721
        XCTAssertEqual(solution(input), output)
    }
}

Tests.defaultTestSuite.run()
