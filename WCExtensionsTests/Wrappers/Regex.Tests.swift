//
//  RegexTest.swift
//  WCExtensionsTests
//
//  Created by Woraphot Chokratanasombat on 3/9/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import XCTest
import Hamcrest
@testable import WCExtensions

class RegexTest: XCTestCase {
    var sut: Regex!
    
    override func setUp() {
        super.setUp()
        sut = Regex("\\d+")
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func testMatchesWithDPLUS_WhenTextISAbc_ShouldEmpty() {
        assertThat(sut.matches("Abc"), hasCount(0))
    }
    
    func testMatchesWithDPLUS_WhenTextIS123_ShouldHave1Match() {
        assertThat(sut.matches("123"), hasCount(1))
    }
}
