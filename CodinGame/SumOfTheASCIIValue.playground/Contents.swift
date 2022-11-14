//  Created by MacMini-8G on 14/07/22.

/* MARK: - The Goal
 You are given a string of characters s. Output the sum of the ASCII value for each character of the string.
 Input
 Line 1: A string S
 Output
 Line 1: The sum N of ASCII values
 Example
 Input
 An exemple
 Output
 959
 
 */// MARK: The Goal

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
func solution(_ S: String) -> Int {
    return S.map{
                Int(
                    String(
                        $0.asciiValue!
                    )
                )!
            }.reduce(0, +)
}

// MARK: - Solution 2
/*
func solution(_ S: String) -> Int {
    var result = 0
    
    for letra in S {
        let valorAtual = letra.asciiValue ?? 0
        result += Int(exactly: valorAtual) ?? 0
    }
    
    return result
}
 */

// MARK: - Test Cases
class Tests: XCTestCase {

    var input: String = ""
    var output: Int = 0

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
        input = "An exemple"
        output = 959
        XCTAssertEqual(solution(input), output)
    }

    func test2() {
        input = "Such abc much amaze"
        output = 1748
        XCTAssertEqual(solution(input), output)
    }

    func test3() {
        input = "Some Camel Case Are Fun"
        output = 1971
        XCTAssertEqual(solution(input), output)
    }

    func test4() {
        input = ":;,=)\"(]}[{>ggwpez"
        output = 1491
        XCTAssertEqual(solution(input), output)
    }
}

Tests.defaultTestSuite.run()
