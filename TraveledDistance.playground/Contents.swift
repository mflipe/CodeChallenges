//  Created by MacMini-8G on 15/07/22.

/* MARK: - The Goal
 The program:
 You must output for each participant in a race the traveled distance (in meters) at a given speed S (centimeters/second) in given amount of time T (minutes).
 
 INPUT:
 Line 1: An integer N for the number of participants.
 Next N lines: Two space separated integers S and T representing respectively the speed S and the time T.
  
 OUTPUT:
 N Lines: An Integer representing the distance traveled.
  
 CONSTRAINTS:
 0 ≤ S ≤ 150
 0 ≤ T ≤ 100000
  
 EXAMPLE:
 Input          Output
 1              120
 20 10
 
*/// MARK: The Goal

/* MARK: - Default Code
 
 public struct StderrOutputStream: TextOutputStream {
     public mutating func write(_ string: String) { fputs(string, stderr) }
 }
 public var errStream = StderrOutputStream()

 /**
  * Auto-generated code below aims at helping you parse
  * the standard input according to the problem statement.
  **/

 let N = Int(readLine()!)!
 if N > 0 {
     for i in 0...(N-1) {
         let inputs = (readLine()!).split(separator: " ").map(String.init)
         let S = Int(inputs[0])!
         let T = Int(inputs[1])!
     }
 }

 // Write an answer using print("message...")
 // To debug: print("Debug messages...", to: &errStream)

 print("answer") */// MARK: Default Code

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
/*
func solution(_ N: Int, _ inputs: [String]) -> [Int] {
    
    var result:[Int] = []
    
    if N > 0 {
        for i in 0...(N-1) {
            let input = inputs[i].split(separator: " ").map(String.init)
            let S = Double(input[0])! / 100
            let T = Double(input[1])! * 60
            result.append(Int(S * T))
        }
    } else {
        return [0]
    }

    return result
}
*/

// MARK: - Solution 2
func solution(_ N: Int, _ inputs: [String]) -> [Int] {
    var result: [Int] = []

    (0...(N-1)).forEach { i in
        let input = inputs[i].split(separator: " ").map(String.init)
        let S = Double(input[0])! / 100
        let T = Double(input[1])! * 60
        result.append(Int(S * T))
    }

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

    var N: Int = 0
    var input: [String] = []
    var output: [Int] = [0]

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
        N = 1
        input = ["20 10"]
        output = [120]
        XCTAssertEqual(solution(N, input), output)
    }

    func test2() {
        N = 1
        input = ["25 10"]
        output = [150]
        XCTAssertEqual(solution(N, input), output)
    }

    func test3() {
        N = 2
        input = ["1 60", "100 1"]
        output = [36, 60]
        XCTAssertEqual(solution(N, input), output)
    }

    func test4() {
        N = 2
        input = ["2 90", "150 2"]
        output = [108, 180]
        XCTAssertEqual(solution(N, input), output)
    }

    func test5() {
        N = 5
        input = ["55 5", "13 10", "11 10", "100 100", "100 100000"]
        output = [165, 78, 66, 6000, 6000000]
        XCTAssertEqual(solution(N, input), output)
    }

    func test6() {
        N = 5
        input = ["5 55", "5 5", "10 11", "200 200", "100 100000"]
        output = [165, 15, 66, 24000, 6000000]
        XCTAssertEqual(solution(N, input), output)
    }

    func test7() {
        N = 1
        input = ["0 60"]
        output = [0]
        XCTAssertEqual(solution(N, input), output)
    }

    func test8() {
        N = 1
        input = ["0 1000"]
        output = [0]
        XCTAssertEqual(solution(N, input), output)
    }
}

Tests.defaultTestSuite.run()
