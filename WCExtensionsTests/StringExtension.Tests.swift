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
    
    func testSubscriptionClosedRange_WhenBEECOOLAt3_5_ShouldEqualToBEE() {
        assertThat(sut[3...5], equalTo("BEE"))
    }
    
    func testSubscriptionRange_WhenBEECOOLAt3_c6_ShouldEqualToBEE() {
        assertThat(sut[3..<6], equalTo("BEE"))
    }
    
    func testSubscriptionRange_WhenBEECOOLAtFrom3_ShouldEqualToBEECOOL() {
        assertThat(sut[3...], equalTo("BEECOOL"))
    }
    
    func testSubscriptionRange_WhenBEECOOLAtUpto4_ShouldEqualToEEBB() {
        assertThat(sut[..<4], equalTo("EEBB"))
    }
    
    func testSubscriptionRange_WhenBEECOOLAtThrough4_ShouldEqualToEEBBE() {
        assertThat(sut[...4], equalTo("EEBBE"))
    }
}

class StringFormatExtensionTests: XCTestCase {
    var sut: String!
    
    func testFormat_WithVarArgs_ShouldFormatCorrectly() {
        assertThat("%@ %d %f".format("bee", 3, 2.0), equalTo("bee 3 2.000000"))
    }

    func testFormat_WithArray_ShouldFormatCorrectly() {
        assertThat("%@ %d %f".format(arguments: ["bee", 3, 2.0]), equalTo("bee 3 2.000000"))
    }
}

class StringToExtensionTests : XCTestCase {
    func testToInt_WhenIs123_ShouldReturn123() {
        assertThat("123".toInt(), equalTo(123))
    }

    func testToInt_WhenIsInvalid_ShouldReturnNil() {
        assertThat("Invalid".toInt(), equalTo(nil))
    }
    
    func testToIntOr_WhenIs456_ShouldReturn456() {
        assertThat("456".toInt(or: 321), equalTo(456))
    }

    func testToIntOr_WhenIsInvalid_ShouldReturnOr() {
        assertThat("Invalid".toInt(or: 321), equalTo(321))
    }

    func testToDouble_WhenIs599d15666_ShouldReturn599d15666() {
        assertThat("599.15666".toDouble(), equalTo(599.15666))
    }

    func testToDouble_WhenIsInvalid_ShouldReturnNil() {
        assertThat("Invalid".toDouble(), equalTo(nil))
    }

    func testToDoubleOr_WhenIs8221d22333_ShouldReturn8221d22333() {
        assertThat("8221.22333".toDouble(or: 432.111), equalTo(8221.22333))
    }

    func testToDoubleOr_WhenIsInvalid_ShouldReturnOr() {
        assertThat("Invalid".toDouble(or: 432.111), equalTo(432.111))
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

    func testIsNotBlank_WhenEmpty_ShouldReturnTrue() {
        sut = ""

        assertThat(sut.isNotBlank(), equalTo(false))
    }

    func testIsNotBlank_WhenOnlyWhitespaces_ShouldReturnTrue() {
        sut = "       "

        assertThat(sut.isNotBlank(), equalTo(false))
    }

    func testIsNotBlank_WhenHasValue_ShouldReturnFalse() {
        sut = "    fda   "

        assertThat(sut.isNotBlank(), equalTo(true))
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
