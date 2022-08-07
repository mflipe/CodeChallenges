//  Created by MacMini-8G on 14/07/22.

/* MARK: - The Goal
 Find the number of different ways of ordering a list of n elements.
 Input
 Line 1: An integer n for the number of elements to be ordered.
 Output
 Line 1: An integer corresponding to the number of different ways the list can be ordered.
 Constraints
 1<=n<=20
 Example
 Input
 4
 Output
 24
 
 */// MARK: The Goal

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
func solution(_ input: String) -> Int {
    let n = Int(input)!
    
    // Forma 1:
    //let result = Int(exactly:(1...n).map(Double.init).reduce(1.0, *))!
    
    // Forma 2:
    let range = (1...n).map(Double.init)
    let value = range.reduce(1.0, *)
    let result = Int(exactly: value)!
    
    return result
}


// MARK: - Solution 2
/*
func solution(_ input: String) -> Int {
    let n = Int(input)!
    if n == 0 {
        return 1
    }
    return n * solution(String(n-1))
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
        input = "4"
        output = 24
        XCTAssertEqual(solution(input), output)
    }

    func test2() {
        input = "3"
        output = 6
        XCTAssertEqual(solution(input), output)
    }

    func test3() {
        input = "1"
        output = 1
        XCTAssertEqual(solution(input), output)
    }

    func test4() {
        input = "14"
        output = 87178291200
        XCTAssertEqual(solution(input), output)
    }

}

Tests.defaultTestSuite.run()
