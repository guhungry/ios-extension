//
//  OptionalExtensionTests.swift
//  WCExtensionsTests
//
//  Created by Woraphot Chokratanasombat on 4/9/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import XCTest
import Hamcrest
@testable import WCExtensions

class OptionalExtensionTests: XCTestCase {
    var sut: Int?
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }

    func testOr_WhenHasValue_ShouldReturnValue() {
        sut = 3

        assertThat(sut.or(555), equalTo(3))
    }

    func testOr_WhenNil_ShouldReturnDefaultValue() {
        sut = nil

        assertThat(sut.or(555), equalTo(555))
    }
}
