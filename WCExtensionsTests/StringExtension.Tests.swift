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

class StringExtensionTest: XCTestCase {
    let sut = "EEBBEECOOL"
    
    func testSubscriptionClosedRange_WhenBEECOOLAt3_5_ShouldEqualToBee() {
        assertThat(sut[3...5], equalTo("BEE"))
    }
    
    func testSubscriptionRange_WhenBEECOOLAt3_6_ShouldEqualToBee() {
        assertThat(sut[3..<6], equalTo("BEE"))
    }
}
