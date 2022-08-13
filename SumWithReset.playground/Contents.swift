//  Created by MacMini-8G on 10/08/22.

/* MARK: - The Goal
 You will be given a string of digits to add up. Start adding them up, but if at any time one of the digits is 0, reset the sum back to 0.
 Input
 
 Line 1: An integer N telling the number of digits in the string.
 Line 2: A string S of N digits.
 
 Output
 The sum, given as an integer.
 
 Constraints
 1 ≤ N ≤ 1000
 
 Example
 Input
 5
 12345
 Output
 15
 
 */// MARK: The Goal


// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
// in 0.049 (0.051) seconds
/*
func solution(_ input1: Int, _ input2: String) -> Int {
    let resultado = input2
                .map{ letra in
                        Int(String(letra))!
                    }
                .reduce(into: 0) { (soma, valor) in
                    if valor == 0 {
                        soma = 0
                    } else {
                        soma += valor
                    }
                }

    return resultado
}
*/
// MARK: - Solution 2
// in 0.048 (0.048) seconds
/*
func solution(_ input1: Int, _ input2: String) -> Int {
    var soma = 0
    
    for i in input2 {
        let valor = Int(String(i))!
        if valor == 0 {
            soma = 0
        } else {
            soma = soma + valor
        }
    }
    
    return soma
}
*/
// MARK: - Solution 3
// 0.030 (0.033) seconds
/*
func solution(_ input1: Int, _ input2: String) -> Int {
    if input2.last == "0" { return 0 }

    if let valor = input2.split(separator: "0").last {
        return valor.map({ Int(String($0))! }).reduce(0, +)
    }
    
    return 0
}
*/
// MARK: - Solution 4
// in 0.014 (0.017) seconds
func solution(_ input1: Int, _ input2: String) -> Int {
    var soma = 0
    
    for i in input2.reversed() {
        let valor = Int(String(i))!
        if valor == 0 { break }
        soma = soma + valor
    }
    
    return soma
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

    var input1: Int = 0
    var input2: String = ""
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
        input1 = 5
        input2 = "12345"
        output = 15
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test2() {
        input1 = 5
        input2 = "45012"
        output = 3
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test3() {
        input1 = 8
        input2 = "08551851"
        output = 33
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test4() {
        input1 = 10
        input2 = "2034923470"
        output = 0
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test5() {
        input1 = 15
        input2 = "073850037536763"
        output = 40
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test6() {
        input1 = 100
        input2 = "1113749621058282022951571325098934348094505934183233828427542557874044563258000581437311075249380649"
        output = 19
        XCTAssertEqual(solution(input1, input2), output)
    }

    func test7() {
        input1 = 1000
        input2 = "7992912489270687741403320654326294130227866083136412970524117840652346652912694604613860889108993428219155872581782250616809842760595234068993153432030512510586812741084662083505453372812400447622891145321181558833039111246959557950677175739464239321125241081488034332391663516442250438623869269945187809788287503332224790510763253643117731164933880551810596272322157572369408835005270520850750679026363412181546089467018271192798126939824919812535366755261489047290253168327581385674460377058060823077071288093319134899472410531306505170439742110598828256213701779193537635161794899628745567891665828984767186704883882162739387210804661987103126775208309376729672979663735846979308076143523460851950099242821496703115537481277121964653008367854948863392799949616798373541561816633729418422945177748939742597931467170827153548256723215534308163767077887948988827438919762440119856151261518407479643789766576082575956054956461923800448291979940422298948904627281525835558449165223507061628394850422593"
        output = 25
        XCTAssertEqual(solution(input1, input2), output)
    }
    
}

Tests.defaultTestSuite.run()
