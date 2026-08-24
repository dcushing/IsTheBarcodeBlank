//
//  DoubleTests.swift
//  IsTheBarcodeBlankTests
//
//  Created by Danielle Cushing1 on 8/24/26.
//

import Testing

struct DoubleTests {
    @Test("isEven is false when number is not even")
    func isEvenIsFalseWhenNumberIsNotEven() {
        #expect(2.3.isEven == false)
    }
    
    @Test("isEven is true when number is even")
    func isEvenIsTrueWhenNumberIsEven() {
        #expect(2.0.isEven == true)
    }
    
    // MARK: isNegative
    @Test("isNegative is false when number is greater than zero")
    func isNegativeIsFalseWhenNumberIsGreaterThanZero() {
        #expect(2.3.isNegative == false)
    }
    
    @Test("isNegative is false when number is zero")
    func isNegativeIsFalseWhenNumberIsZero() {
        #expect(0.0.isNegative == false)
    }
    
    @Test("isNegative is true when number is less than zero")
    func isNegativeIsTrueWhenNumberIsLessThanZero() {
        let num: Double = -12.0
        #expect(num.isNegative == true)
    }
}
