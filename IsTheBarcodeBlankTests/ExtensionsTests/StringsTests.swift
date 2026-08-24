//
//  StringsTests.swift
//  IsTheBarcodeBlankTests
//
//  Created by Danielle Cushing1 on 8/24/26.
//

import Testing

struct StringsTests {
    // MARK: asInt
    @Test("asInt returns nil if string can't be converted to int")
    func asIntReturnsNilIfStringIsNotInt() async throws {
        #expect("not an int".asInt == nil)
    }
    
    @Test("asInt returns int if string can be converted to int")
    func asIntReturnsIntIfStringIsInt() async throws {
        #expect("3".asInt == 3)
    }
    
    // MARK: asDouble
    @Test("asDouble returns nil if string can't be converted to double")
    func asDoubleReturnsNilIfStringIsNotDouble() async throws {
        #expect("not a double".asInt == nil)
    }
    
    @Test("asDouble returns double if string can be converted to double")
    func asDoubleReturnsDoubleIfStringIsDouble() async throws {
        #expect("3.3".asDouble == 3.3)
    }

    // MARK: isNumber
    @Test("isNumber is false if self is empty")
    func isNumberIsFalseIfSelfIsEmpty() {
        #expect("".isNumber == false)
    }

    @Test("isNumber is true if asDouble is not nil")
    func isNumberIsTrueIfAsDoubleIsNotNil() {
        #expect("3.3".isNumber == true)
    }
    
    @Test("isNumber is true if asInt is not nil")
    func isNumberIsTrueIfAsIntIsNotNil() {
        #expect("3".isNumber == true)
    }

    @Test("isNumber is false if asDouble and asInt are nil")
    func isNumberIsFalseIfAsDoubleAndAsIntAreNil() {
        #expect("not a number".isNumber == false)
    }

    // MARK: isUrl
    @Test("isUrl is true for valid urls") func isUrlReturnsTrueForValidUrls() async throws {
        #expect("https://www.example.com".isUrl == true)
        #expect("http://example.com".isUrl == true)
        #expect("www.example.com".isUrl == true)
        #expect("example.com".isUrl == true)
        #expect("https://example-dash.com".isUrl == true)
        #expect("https://example.com".isUrl == true)
        #expect("file:///users/logo.jpg".isUrl == true)
        #expect("ftp://ftp.example.com/file.txt".isUrl == true)
        #expect("mailto:johndoe@fakeemail.com".isUrl == true)
        #expect("https://user:pass@example.com".isUrl == true)
      }

      @Test("isUrl is true for valid urls with parameters") func isUrlReturnsTrueForValidUrlsWithParameters() async throws {
        #expect("https://example.com?q=some%20parameter:1".isUrl == true)
        #expect("https://example.com#valid".isUrl == true)
        #expect("https://example.com?=paramenter#valid".isUrl == true)
      }

      @Test("isUrl is true for valid urls with paths and file extensions") func isUrlReturnsTrueForValidUrlsWithPaths() async throws {
        #expect("https://example.com/some/path".isUrl == true)
        #expect("https://example.com/path.php".isUrl == true)
        #expect("https://example.com/path.html".isUrl == true)
        #expect("https://example.com/path.txt".isUrl == true)
        #expect("https://www.example.com:8080".isUrl == true)
      }

      @Test("isUrl is true for urls with valid TLD and internationalized domain name") func isUrlReturnsTrueForValidTLDsAndInternationalizedDomain() async throws {
        #expect("https://xn--n3h.com".isUrl == true)
        #expect("https://example.travel".isUrl == true)
      }

      @Test("isUrl is false for invalid urls") func isUrlIsFalseForInvalidUrls() async throws {
        #expect(" https://example.com?q=some%20parameter:1 ".isUrl == false)
        #expect("".isUrl == false)
        #expect("not a valid url".isUrl == false)
        #expect("this is a valid url: https://www.example.com".isUrl == false)
        #expect("http:/example.com".isUrl == false)
        #expect("".isUrl == false)
        #expect("https://".isUrl == false)
        #expect("https://example.com:-80".isUrl == false)
        #expect("ftp:/example.com".isUrl == false)
      }
    
    // MARK: isNotEmpty
    @Test("isNotEmpty is false when string is empty")
    func isNotEmptyIsFalseWhenStringIsEmpty() {
        #expect("".isNotEmpty == false)
    }
    
    @Test("isNotEmpty is true when string is not empty")
    func isNotEmptyIsTrueWhenStringIsNotEmpty() {
        #expect("not empty".isNotEmpty == true)
    }
    
    // MARK: isEven
    @Test("isEven is false when number can't be convered to double")
    func isEvenIsFalseWhenNumberIsNotDouble() {
        #expect("not a number".isEven == false)
    }

    @Test("isEven is false when number is not even")
    func isEvenIsFalseWhenNumberIsNotEven() {
        #expect("2.3".isEven == false)
    }
    
    @Test("isEven is true when number is even")
    func isEvenIsTrueWhenNumberIsEven() {
        #expect("2.0".isEven == true)
    }
    
    // MARK: isNegative
    @Test("isNegative is false when number can't be convered to double")
    func isNegativeIsFalseWhenNumberIsNotDouble() {
        #expect("not a number".isNegative == false)
    }

    @Test("isNegative is false when number is greater than zero")
    func isNegativeIsFalseWhenNumberIsGreaterThanZero() {
        #expect("2.3".isNegative == false)
    }
    
    @Test("isNegative is false when number is zero")
    func isNegativeIsFalseWhenNumberIsZero() {
        #expect("0.0".isNegative == false)
    }
    
    @Test("isNegative is true when number is less than zero")
    func isNegativeIsTrueWhenNumberIsLessThanZero() {
        #expect("-12.0".isNegative == true)
    }
}
