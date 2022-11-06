//  Created by MacMini-8G on 09/08/22.

/* MARK: - The Goal
 The program:
 Your program must output all the odd numbers from 1 to N where N is given as input.
 If N is an odd number, it must be included in the output.

 INPUT:
 1 integer N.

 OUTPUT:
 All odd numbers from 1 to N

 CONSTRAINTS:
 0 < N < 1000

 EXAMPLE:
 Input
 9
 Output
 1
 3
 5
 7
 9
 
 */// MARK: The Goal

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
/*
func solution(_ input: String) -> [Int] {
    let N = Int(input)!
    var result:[Int] = []
    
    for i in 1...N {
        if i.isMultiple(of: 2) {
        } else {
            result.append(i)
        }
    }
    return result
}
*/
// MARK: - Solution 2
func solution(_ input: String) -> [Int] {
    var result:[Int] = []
    (0...Int(input)!).forEach({ number in
        if number.isMultiple(of: 2) == false {
            result.append(number)
        }
    })
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
    var output: [Int] = []

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
        input = "9"
        output = [1, 3, 5, 7, 9]
        XCTAssertEqual(solution(input), output)
    }
    
    func test2() {
        input = "101"
        output = Array(stride(from: 1, through: 101, by: 2))
        XCTAssertEqual(solution(input), output)
    }
    
    func test3() {
        input = "20"
        output = Array(stride(from: 1, through: 20, by: 2))
        XCTAssertEqual(solution(input), output)
    }
    
    func test4() {
        input = "2"
        output = Array(stride(from: 1, through: 2, by: 2))
        XCTAssertEqual(solution(input), output)
    }

}

Tests.defaultTestSuite.run()
