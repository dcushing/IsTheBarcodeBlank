//
//  IntTests.swift
//  IsTheBarcodeBlankTests
//
//  Created by Danielle Cushing1 on 8/24/26.
//

import Testing

struct IntTests {
    @Test("isEven is false when number is not even")
    func isEvenIsFalseWhenNumberIsNotEven() {
        #expect(3.isEven == false)
    }
    
    @Test("isEven is true when number is even")
    func isEvenIsTrueWhenNumberIsEven() {
        #expect(2.isEven == true)
    }
    
    // MARK: isNegative
    @Test("isNegative is false when number is greater than zero")
    func isNegativeIsFalseWhenNumberIsGreaterThanZero() {
        #expect(2.isNegative == false)
    }
    
    @Test("isNegative is false when number is zero")
    func isNegativeIsFalseWhenNumberIsZero() {
        #expect(0.isNegative == false)
    }
    
    @Test("isNegative is true when number is less than zero")
    func isNegativeIsTrueWhenNumberIsLessThanZero() {
        let num: Int = -12
        #expect(num.isNegative == true)
    }
}
