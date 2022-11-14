//  Created by MacMini-8G on 14/07/22.

/* MARK: - The Goal
 
 In golf course, each hole has a "par", value which is the maximum number of swings that players should ideally need to clear the hole.
 
 Once a player has cleared the hole, the par is subtracted from the player's effective swing count, resulting in the player's score for that hole (i.e. 2 swings for a par 3 scores -1).
 
 The final score for a player on a course is the total of his scores for each hole in the course.
 
 Given a score card for a 18-hole course, your program must output the player's score.
 
 Input
 Line 1: 18 numbers separated by spaces, representing the pars for each hole.
 Line 2: 18 numbers separated by spaces, representing the player's swing count for each hole.
 Output
 Line 1: the player's final score for the course.
 
 MARK: Example
 Input
 4 4 3 4 4 5 4 3 5 4 3 4 5 4 4 3 4 5
 4 3 2 4 3 4 3 3 4 4 3 4 6 4 5 3 3 4
 Output
 -6
 
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
 
 for i in ((readLine()!).split(separator: " ").map(String.init)) {
 let x = Int(i)!
 }
 for i in ((readLine()!).split(separator: " ").map(String.init)) {
 let x = Int(i)!
 }
 
 // Write an answer using print("message...")
 // To debug: print("Debug messages...", to: &errStream)
 
 print("answer")
 */// MARK: Default Code

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
/*
func solution(_ input1: String, _ input2: String) -> Int {
    var sum = 0
    
    for v in Array(zip(input1.split(separator: " "), input2.split(separator: " ")))  {
        sum += Int(v.1)! - Int(v.0)!
    }
    
    print(sum)
    return sum
}
*/

// MARK: - Solution 2

func solution(_ pars: String, _ player: String) -> Int {
    return zip(
        pars.split(separator: " ").map {Int($0)!},
        player.split(separator: " ").map {Int($0)!}
    ).reduce(into: 0) { acc, value in
        acc += value.1 - value.0
    }
}

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
