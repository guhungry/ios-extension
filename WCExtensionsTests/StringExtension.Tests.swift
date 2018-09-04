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
