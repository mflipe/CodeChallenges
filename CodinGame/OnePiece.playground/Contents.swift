//  Created by MacMini-8G on 14/07/22.
import UIKit

/* MARK: - The Goal
 
 */// MARK: The Goal

/* MARK: - Default Code
 
 */// MARK: Default Code

// MARK: - Imports

import Foundation
import XCTest

// MARK: - Solution 1
enum DevilFruit: Int {
    case logia = 100
    case paramecia = 75
    case zoan = 25
    case none = 0
    
    init(type: String) {
        switch type {
        case "logia":
            self = .logia
        case "paramecia":
            self = .paramecia
        case "zoan":
            self = .zoan
        default:
            self = .none
        }
    }
}



func solution(_ input: [String]) -> Int {
    var result: Int = 0
    
    for i in input {
        let fruitValue: DevilFruit = DevilFruit(type: i)
        result += fruitValue.rawValue
    }
    
    return result
}

func solution2(_ input: [String]) -> Int {
    var soma:Int = 0
    
    for i in input {
        let fruits = i
        if fruits == "logia" {soma += 100}
        else if fruits == "paramecia" {soma += 75}
        else if fruits == "zoan" {soma += 25}
    }
    
    return soma
}

// MARK: - Solution 2

enum TipoChavePix {
    case CPF
    case CNPJ
    case email
    case randomKey
}

func router(type: TipoChavePix, value: String) {
    switch type {
    case .CPF:
        break
        
    case .CNPJ:
        break
        
    case .email:
        break
        
    case .randomKey:
        break
    }
}

enum PurchaseEndpoint {
    private var baseURL: String {
        return "https://www.purchase.com"
    }
    
    case product
    case user
    case shop
    case payment
    case productWith(UUID)
    case userWith(UUID)
    case shopWith(UUID)
    case paymentWith(UUID)
    
    private var fullPath: String {
        var endpoint: String
        
        switch self {
        case .productWith(let id):
            endpoint = "/product/\(id.uuidString)"
            
        case .userWith(let id):
            endpoint = "/user/\(id.uuidString)"
            
        case .shopWith(let id):
            endpoint = "/store/\(id.uuidString)"
            
        case .paymentWith(let id):
            endpoint = "/payment/\(id.uuidString)"
            
        default:
            endpoint = "/\(String(describing: self))"
        }
        return baseURL + endpoint
    }
    
    var url: URL {
        guard let url = URL(string: fullPath) else {
            preconditionFailure("The url used in \(PurchaseEndpoint.self) is not valid")
        }
        return url
    }
}

let url = PurchaseEndpoint.paymentWith(UUID(uuidString: "F0F8A584-D83B-45DF-B2FE-78C9AE60A5C0")!).url
print(url)
// output: url = https://www.purchase.com/payment/F0F8A584-D83B-45DF-B2FE-78C9AE60A5C0


// MARK: - Test Cases
class Tests: XCTestCase {
    
    var input: [String] = []
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
        input = ["logia", "paramecia", "zoan"]
        output = 200
        XCTAssertEqual(solution(input), output)
    }
    
}

Tests.defaultTestSuite.run()
