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
    
    func testForEachIndexed_ShouldGiveCorrect_Value() {
        sut.forEachIndexed { (index, value) in
            assertThat(index, equalTo(value))
        }
    }
    
    func testMapIndexed_ShouldCallWithCorrectIndex() {
        let actual = sut.mapIndexed { (index, item) in
            return item + index
        }
        
        assertThat(actual, equalTo([0, 2, 4, 6]))
    }

    func testFirstIndexed_ShouldReturnCorrectPair() {
        sut = [0, 2, 4, 6]
        let actual = (sut.firstIndexed { (index, item) in return item == 4 })

        assertThat(actual?.0, equalTo(2))
        assertThat(actual?.1, equalTo(4))
    }

    func testFirstIndexed_ShouldReturnNil() {
        sut = [0, 2, 4, 6]
        let actual = (sut.firstIndexed { (index, item) in return item > 8 })

        assertThat(actual?.0, equalTo(nil))
        assertThat(actual?.1, equalTo(nil))
    }

    func testFilterIndexed_WhenAllFalse_ShouldReturnEmpty() {
        sut = [0, 2, 4, 6]
        let actual = sut.filterIndexed { (index, item) in return item > 8 }

        assertThat(actual, hasCount(0))
    }

    func testFilterIndexed_WhenAll1True_ShouldReturn1Items() {
        sut = [0, 2, 4, 6]
        let actual = sut.filterIndexed { (index, item) in return item == 2 }
        let item = actual[0]

        assertThat(actual, hasCount(1))
        assertThat(item.offset, equalTo(1))
        assertThat(item.element, equalTo(2))
    }

    func testFilterIndexed_WhenAllManyTrue_ShouldReturnEqualThat() {
        sut = [0, 2, 4, 6]
        let actual = sut.filterIndexed { (index, item) in return item > 2 }

        assertThat(actual, hasCount(2))
        var item = actual[0]
        assertThat(item.offset, equalTo(2))
        assertThat(item.element, equalTo(4))
        item = actual[1]
        assertThat(item.offset, equalTo(3))
        assertThat(item.element, equalTo(6))
    }
}
