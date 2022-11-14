//  Created by MacMini-8G on 14/07/22.

/* MARK: - The Goal
 Short statement : From the two sides adjacent to a right angle in a right triangle,
 determine the size of the third side.
 Remember: a² + b² = c².

 Long statement : Perched on his tower, our friend Pythagoras looked down and asked:
 "What is the distance "c" between that sheep in the distance and me?
 In order to determine this distance, Pythagoras knew in advance the distance "a" between the sheep and the tower,
 and the height "b" of the tower.
 Assuming that the tower was perpendicular to the ground, he came to the conclusion that a² + b² = c².
 Help our friend determine the distance from the sheep.
 
 Input
 First line : a float a for the distance between the bottom of the tower and the sheep
 Second line : a float b for the height of the tower
 Output
 First line : the distance between the top of the tower and the sheep rounded to two decimal places
 Constraints
 1 ≤ a, b≤ 15000
 Example
 Input
 1.00
 1.00
 Output
 1.41
 
 */// MARK: The Goal

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
func solution(_ input: [Double]) -> String {
     let firstNumber = input[0]
     let SecondNumber = input[1]
     let Result = sqrt( pow(firstNumber, 2) + pow(SecondNumber, 2) )
     return String(format: "%.2f", Result)
}

// MARK: - Test Cases
class Tests: XCTestCase {

    var input: [Double] = []
    var output: String = "1.41"

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
        input = [1.0, 1.0]
        output = "1.41"
        XCTAssertEqual(solution(input), output)
    }

    func test2() {
        input = [6.0, 3.0]
        output = "6.71"
        XCTAssertEqual(solution(input), output)
    }

    func test3() {
        input = [2.0, 7.0]
        output = "7.28"
        XCTAssertEqual(solution(input), output)
    }

    func test4() {
        input = [6535.94, 7634.0]
        output = "10049.70"
        XCTAssertEqual(solution(input), output)
    }
}

Tests.defaultTestSuite.run()
