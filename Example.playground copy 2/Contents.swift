//  Created by MacMini-8G on 14/07/22.

/* MARK: The Goal
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

---

Found: 4
Expected: 40

Failure
Found: 5
Expected: 75

Failure
Found: 15
Expected: 1800

Failure
Found: 58
Expected: 99238

Failure
Found: 502
Expected: 63379006

Failure
Found: 0
Expected: 0

Failure
Found: 5210
Expected: 70723952550


 */// MARK: The Goal

/*
 MARK: Default Code
import Foundation

let input =  Int(readLine()!)!

print(
    stride(from: input, to: 0, by: -1)
    .reduce(into: 0) { acumulado, valor in
        acumulado += valor * input
    }
)
 */// MARK: Default Code

// MARK: Imports

import Foundation
import XCTest

// MARK: Solution 1
func solution() -> Void {}

// MARK: Solution 2

// MARK: Test Cases

public class TestObserver: NSObject, XCTestObservation {
    public func testCase(_ testCase: XCTestCase,
                           didFailWithDescription description: String,
                           inFile filePath: String?,
                           atLine lineNumber: Int) {
        //print("1️⃣ failure description: \(description)")
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
    
    var input1: String = ""
    var input2: String = ""
    var output: Int = 0
    var myReport: String = ""
    
    override class func setUp() {
        super.setUp()
        //XCTestObservationCenter.shared.addTestObserver(TestObserver())
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

