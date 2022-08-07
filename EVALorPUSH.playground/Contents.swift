//  Created by MacMini-8G on 14/07/22.

/* MARK: - The Goal
 1337 school uses a peer-to-peer learning program,
 so if you want to validate a project you must defend your code against your peers.
 In exchange for your peer's time, you pay for the evaluation with evaluation points.
 Each PUSH costs you 3 evaluation points and each time you evaluate someone you gain 1 point.

 Your program have to output the remaining evaluation points from start after n operations, EVAL or PUSH.
 if at some point the operation is PUSH but the evaluation points are not enough, output Go evaluate.
 e.g : start = 2, "EVAL EVAL EVAL PUSH" =====> 2+1+1+1-3=2
 Input
 Line 1: start starting evaluation points int
 Line 2: n number of operations int
 Next n lines: operation "EVAL or PUSH" string
 Output
 Line 1: An integer for the remaining evaluation points, or a string Go evaluate.
 Constraints
 
 Example
 
 Input
 5
 4
 PUSH
 EVAL
 PUSH
 EVAL
 
 Output
 1
 
 
 */// MARK: The Goal

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
func solution(_ start: Int, _ nNumbers: Int, _ operations: [String] ) -> String {
    var start = start
    // var nNumbers = nNumbers

    for operation in operations {
        print(start, operation)
        if operation == "EVAL" {
            start += 1
        } else {
            start -= 3
        }

        if start < 0 {
            return "Go evaluate"
        }
    }
    print(start)
    return String(start)
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

    var start: Int = 0
    var nNumbers: Int = 0
    var operations: [String] = []
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
        start = 5
        nNumbers = 4
        operations = [
            "PUSH",
            "EVAL",
            "PUSH",
            "EVAL"
        ]
        output = "1"
        XCTAssertEqual(solution(start, nNumbers, operations), output)
    }

    func test2() {
    start = 1
    nNumbers = 3
    operations = [
            "EVAL",
            "PUSH",
            "EVAL"
        ]
        output = "Go evaluate"
        XCTAssertEqual(solution(start, nNumbers, operations), output)
    }

    func test3() {
    start = 12
    nNumbers = 4
    operations = [
            "PUSH",
            "PUSH",
            "PUSH",
            "PUSH"
        ]
        output = "0"
        XCTAssertEqual(solution(start, nNumbers, operations), output)
    }

    func test4() {
        start = 5
        nNumbers = 10
        operations = [
            "EVAL",
            "EVAL",
            "EVAL",
            "EVAL",
            "EVAL",
            "EVAL",
            "EVAL",
            "EVAL",
            "EVAL",
            "EVAL"
        ]
        output = "15"
        XCTAssertEqual(solution(start, nNumbers, operations), output)
    }
}

Tests.defaultTestSuite.run()
