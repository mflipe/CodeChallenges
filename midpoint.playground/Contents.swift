//  Created by MacMini-8G on 14/07/22.

/* MARK: - The Goal
 The program:
 Your program must find the point that is exactly between two other points.

 You are given the coordinates (x, y) of two points which bind a line segment.
 The midpoint of this line segment is the target point.

 Be careful with float numbers and use . as a decimal mark.

 INPUT:
 Line 1: Two integers separated by whitespace x1 and y1, the coordinates of the first point.
 Line 2: Two integers separated by whitespace x2 and y2, the coordinates of the second point.

 OUTPUT:
 Two integers separated by whitespace, the coordinates of the midpoint.

 CONSTRAINTS:
 -100 < x,y < 100

 EXAMPLE:
 Input
 1 2
 3 5
 Output
 2 3.5
 
 */// MARK: The Goal

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
/*
func solution(_ input1: [String], _ input2: [String] ) -> String {
    var x1 = Double(input1[0])!
    var y1 = Double(input1[1])!
    var x2 = Double(input2[0])!
    var y2 = Double(input2[1])!
    
    // --//--
    var r1 = ""
    var r2 = ""
    
    var xf = ( x1 + x2 ) / 2
    var yf = ( y1 + y2 ) / 2
    
    print("x", x1, x2, x1+x2, (x1 + x2).remainder(dividingBy: 2), (x1 + x2).remainder(dividingBy: 2) == 0.0)
    print("y", y1, y2, y1+y2, (y1 + y2).remainder(dividingBy: 2), (y1 + y2).remainder(dividingBy: 2) == 0.0)
    
    if xf.rounded() == xf {
        r1 = String(format: "%.0f", xf)
    } else {
        r1 = String(format: "%.1f", xf)
    }
    
    if yf.rounded() == yf {
        r2 = String(format: "%.0f", yf)
    } else {
        r2 = String(format: "%.1f", yf)
    }
    
    print("\(r1) \(r2)")
    
    return "\(r1) \(r2)"
}
 */

// MARK: - Solution 2
func solution(_ input1: [String], _ input2: [String] ) -> String {
    var x1 = Double(input1[0])!
    var y1 = Double(input1[1])!
    var x2 = Double(input2[0])!
    var y2 = Double(input2[1])!
    
    // --//--
    var r1 = ""
    var r2 = ""
    
    var xf = ( x1 + x2 ) / 2
    var yf = ( y1 + y2 ) / 2
    
    if (x1 + x2).remainder(dividingBy: 2) == 0.0 {
        r1 = String(format: "%.0f", xf)
    } else {
        r1 = String(format: "%.1f", xf)
    }
    
    if (y1 + y2).remainder(dividingBy: 2) == 0.0 {
        r2 = String(format: "%.0f", yf)
    } else {
        r2 = String(format: "%.1f", yf)
    }
    
    return "\(r1) \(r2)"
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

    var input1: [String] = []
    var input2: [String] = []
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
        input1 = ["1", "2"]
        input2 = ["3", "5"]
        output = "2 3.5"
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test2() {
        input1 = ["0", "0"]
        input2 = ["10", "10"]
        output = "5 5"
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test3() {
        input1 = ["-7", "42"]
        input2 = ["42", "-7"]
        output = "17.5 17.5"
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test4() {
        input1 = ["-99", "0"]
        input2 = ["-2", "-10"]
        output = "-50.5 -5"
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test5() {
        input1 = ["-99", "-99"]
        input2 = ["99", "99"]
        output = "0 0"
        XCTAssertEqual(solution(input1, input2), output)
    }
}

Tests.defaultTestSuite.run()
