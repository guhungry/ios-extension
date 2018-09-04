//
//  ArrayExtension.swift
//  WCExtensionsTests
//
//  Created by Woraphot Chokratanasombat on 4/9/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import XCTest
import Hamcrest
@testable import WCExtensions

class CollectionExtension: XCTestCase {
    private var sut: [Int]!
    
    override func setUp() {
        super.setUp()
        
        sut = [0, 1, 2, 3]
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }

    func testGetOrNull_AtExistedPosition_ShouldReturnCorrectElement() {
        assertThat(sut.getOrNull(0), equalTo(0))
        assertThat(sut.getOrNull(3), equalTo(3))
    }

    func testGetOrNull_AtUnexistedPosition_ShouldReturnCorrectElement() {
        assertThat(sut.getOrNull(4), equalTo(nil))
        assertThat(sut.getOrNull(10), equalTo(nil))
    }
    
    func testForEachIndex_ShouldGiveCorrect_Value() {
        sut.forEachIndexed { (index, value) in
            assertThat(index, equalTo(value))
        }
    }
}
