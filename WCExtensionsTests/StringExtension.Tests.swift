//
//  StringExtensionTest.swift
//  WCExtensions
//
//  Created by Woraphot Chokratanasombat on 3/9/2018 AD.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import XCTest
import Hamcrest
@testable import WCExtensions

class StringExtensionTests: XCTestCase {
    let sut = "EEBBEECOOL"
    
    func testSubscriptionClosedRange_WhenBEECOOLAt3_5_ShouldEqualToBee() {
        assertThat(sut[3...5], equalTo("BEE"))
    }
    
    func testSubscriptionRange_WhenBEECOOLAt3_6_ShouldEqualToBee() {
        assertThat(sut[3..<6], equalTo("BEE"))
    }
}

class StringFormatExtensionTests: XCTestCase {
    var sut: String!
    
    func testFormat_ShouldFormatCorrectly() {
        assertThat("%@ %d %f".format(args: "bee", 3, 2.0), equalTo("bee 3 2.000000"))
    }
}

class StringToExtensionTests : XCTestCase {
    var sut: String!
    
    func testToInt_WhenIs123_ShouldReturn123() {
        sut = "123"
        
        assertThat(sut.toInt(), equalTo(123))
    }
    
    func testToIntOr_WhenIs456_ShouldReturn456() {
        sut = "456"
        
        assertThat(sut.toInt(), equalTo(456))
    }
    
    func testToIntOr_WhenIsInvalid_ShouldReturnOr() {
        sut = "Invalid"
        
        assertThat(sut.toInt(or: 321), equalTo(321))
    }
}

class OptionalStringExtensionTests : XCTestCase {
    var sut: String?

    func testOr_WhenHasValue_ShouldReturnThatValue() {
        sut = "BEE"

        assertThat(sut.or("HAHA"), equalTo("BEE"))
    }

    func testOr_WhenNil_ShouldReturnDefaultValue() {
        sut = nil

        assertThat(sut.or("HAHA"), equalTo("HAHA"))
    }

    func testOrEmpty_WhenHasValue_ShouldReturnThatValue() {
        sut = "BEE"

        assertThat(sut.orEmpty(), equalTo("BEE"))
    }

    func testOrEmpty_WhenNil_ShouldReturnEmptyString() {
        sut = nil

        assertThat(sut.orEmpty(), equalTo(""))
    }
}

class StringValidateExtensionTests : XCTestCase {
    var sut: String!

    func testIsBlank_WhenEmpty_ShouldReturnTrue() {
        sut = ""

        assertThat(sut.isBlank(), equalTo(true))
    }

    func testIsBlank_WhenOnlyWhitespaces_ShouldReturnTrue() {
        sut = "       "

        assertThat(sut.isBlank(), equalTo(true))
    }

    func testIsBlank_WhenHasValue_ShouldReturnFalse() {
        sut = "    fda   "

        assertThat(sut.isBlank(), equalTo(false))
    }
}

class StringOptionalValidateExtensionTests : XCTestCase {
    var sut: String?

    func testIsNil_WhenOptional_ShouldReturnTrue() {
        sut = nil

        assertThat(sut.isNil(), equalTo(true))
    }

    func testIsNil_WhenIsString_ShouldReturnFalse() {
        sut = ""

        assertThat(sut.isNil(), equalTo(false))
    }

    func testIsNilOrBlank_WhenOptional_ShouldReturnTrue() {
        sut = nil

        assertThat(sut.isNilOrBlank(), equalTo(true))
    }

    func testIsNilOrBlank_WhenEmpty_ShouldReturnTrue() {
        sut = ""

        assertThat(sut.isNilOrBlank(), equalTo(true))
    }

    func testIsNilOrBlank_WhenOnlyWhitespaces_ShouldReturnTrue() {
        sut = "       "

        assertThat(sut.isNilOrBlank(), equalTo(true))
    }

    func testIsNilOrBlank_WhenHasValue_ShouldReturnFalse() {
        sut = "   da    "

        assertThat(sut.isNilOrBlank(), equalTo(false))
    }
    
    func testOrEmpty_WhenOptional_ShouldReturnEmpty() {
        sut = nil
        
        assertThat(sut.orEmpty(), equalTo(""))
    }
    
    func testOrEmpty_WhenHasValue_ShouldReturnValue() {
        sut = "HAHAHA"
        
        assertThat(sut.orEmpty(), equalTo("HAHAHA"))
    }
}
