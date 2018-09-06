//
//  CollectionOptionalExtensionTests.swift
//  WCExtensionsTests
//
//  Created by Woraphot Chokratanasombat on 6/9/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import XCTest
import Hamcrest
@testable import WCExtensions

class CollectionOptionalExtensionTests: XCTestCase {
    private var sut: [Int]?
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func testToArray_WhenOptional_ShouldReturnBlankArray() {
        sut = nil
        
        assertThat(sut.toArray(), equalTo([]))
    }
    
    func testToArray_WhenHasValue_ShouldReturnCorrectArray() {
        
        assertThat([5].toArray(), equalTo([5]))
        assertThat(["B"].toArray(), equalTo(["B"]))
    }
}
