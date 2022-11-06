//  Created by MacMini-8G on 14/07/22.

/* MARK: - The Goal
 You must output the correct string concatenation depending on the sum result.
 If it's positive, output "Foo"
 If it's negative, output "Bar"
 If it's even, concatenate " & Baz" to the output
 If it's odd, concatenate " & Qux" to the output
 Input
 Line 1 : An integer N for the number of integers to sum.
 Next N lines: A positive or negative integer K
 Output
 Line 1 : A string containing the correct two words.
 Constraints
 -100<=K<=100
 Example
 Input
 1
 6
 Output
 Foo & Baz
 
 */// MARK: The Goal

/* MARK: - Default Code

 */// MARK: Default Code

// MARK: - Imports

import Foundation
import XCTest
import Darwin

// MARK: - Solution 1
func solution(_ N: String, _ K: [String]) -> String {
    let N = Int(N)!
    if N > 0 {
        var number = 0
        for num in K {
            number += Int(num)!
        }
        var result = number > 0 ? "Foo" : "Bar"
        result += number.isMultiple(of: 2) ? " & Baz" : " & Qux"
        return result
    }
    return ""
}

// MARK: - Solution 2
/*
func solution(_ N: String, _ K: [String]) -> String {
    let N = Int(N)!
    if N > 0 {
        var resultado = ""
        var soma = 0
        for i in K {
            let K = Int(i)!
            soma += K
        }
        
        if soma >= 0 {
            resultado += "Foo"
        } else {
            resultado += "Bar"
        }

        if soma.isMultiple(of: 0) {
            resultado += " & Baz"
        } else {
            resultado += " & Qux"
        }
        
        return resultado
    }
    
    return ""
}
 */

// MARK: - Test Cases
class Tests: XCTestCase {

    var input1: String = ""
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
        input1 = "1"
        input2 = ["6"]
        output = "Foo & Baz"
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test2() {
        input1 = "1"
        input2 = ["-4"]
        output = "Bar & Baz"
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test3() {
        input1 = "3"
        input2 = ["-5", "7", "2"]
        output = "Foo & Baz"
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test4() {
        input1 = "3"
        input2 = ["7", "5", "-13"]
        output = "Bar & Qux"
        XCTAssertEqual(solution(input1, input2), output)
    }
    
    func test5() {
        input1 = "4"
        input2 = ["-11", "-2", "8", "10"]
        output = "Foo & Qux"
        XCTAssertEqual(solution(input1, input2), output)
    }

}

Tests.defaultTestSuite.run()
