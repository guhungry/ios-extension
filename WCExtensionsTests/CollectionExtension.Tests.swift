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

    func testGetOrNil_AtExistedPosition_ShouldReturnCorrectElement() {
        assertThat(sut.getOrNil(0), equalTo(0))
        assertThat(sut.getOrNil(3), equalTo(3))
    }

    func testGetOrNil_AtUnexistedPosition_ShouldReturnNil() {
        assertThat(sut.getOrNil(4), equalTo(nil))
        assertThat(sut.getOrNil(10), equalTo(nil))
    }
    
    func testGetOrElse_AtExistedPosition_ShouldReturnCorrectElement() {
        assertThat(sut.getOr(2, else: 1), equalTo(2))
        assertThat(sut.getOr(1, else: 2), equalTo(1))
    }
    
    func testGetOrElse_AtUnexistedPosition_ShouldReturnElse() {
        assertThat(sut.getOr(5, else: 1), equalTo(1))
        assertThat(sut.getOr(8, else: 2), equalTo(2))
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
    
    func testCount_ShouldReturnCorrectCountMatchPredicate() {
        assertThat(sut.count { _ in true }, equalTo(4))
        assertThat(sut.count { $0 % 2 == 0 }, equalTo(2))
        assertThat(sut.count { $0 > 2 }, equalTo(1))
        assertThat(sut.count { $0 > 10 }, equalTo(0))
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
    
    func testFilterNot_ShouldFilterCorrrectly() {
        sut = [2, 4, 6, 8, 10]
        
        assertThat(sut.filterNot { _ in true }, equalTo([]))
        assertThat(sut.filterNot { $0 >= 8 }, equalTo([2, 4, 6]))
        assertThat(sut.filterNot { _ in false }, equalTo([2, 4, 6, 8, 10]))
    }
    
    func testFilterIndexedNot_WhenAllTrue_ShouldEmpty() {
        sut = [2, 4, 6, 8, 10]
        
        let actual = sut.filterIndexedNot { _, _ in true }
        assertThat(actual, hasCount(0))
    }
    
    func testFilterIndexedNot_WhenSomeTrue_ShouldReturnCorrectly() {
        sut = [2, 4, 6, 8, 10]
        
        let actual = sut.filterIndexedNot { index, it in it >= 8 }
        assertThat(actual, hasCount(3))
        var item = actual[0]
        assertThat(item.offset, equalTo(0))
        assertThat(item.element, equalTo(2))
        item = actual[1]
        assertThat(item.offset, equalTo(1))
        assertThat(item.element, equalTo(4))
        item = actual[2]
        assertThat(item.offset, equalTo(2))
        assertThat(item.element, equalTo(6))
    }
    
    func testFilterIndexedNot_WhenAllFalse_ShouldReturnAllItem() {
        sut = [2, 4, 6, 8, 10]
        
        let actual = sut.filterIndexedNot { _, _ in false }
        assertThat(actual, hasCount(5))
        var item = actual[0]
        assertThat(item.offset, equalTo(0))
        assertThat(item.element, equalTo(2))
        item = actual[1]
        assertThat(item.offset, equalTo(1))
        assertThat(item.element, equalTo(4))
        item = actual[2]
        assertThat(item.offset, equalTo(2))
        assertThat(item.element, equalTo(6))
        item = actual[3]
        assertThat(item.offset, equalTo(3))
        assertThat(item.element, equalTo(8))
        item = actual[4]
        assertThat(item.offset, equalTo(4))
        assertThat(item.element, equalTo(10))
    }
    
    func testReduceIndexed_ShouldLoopWithCorrectValue() {
        sut = [0, 2, 4, 6]
        
        var actual = sut.reduceIndexed(initial: 0) { acc, index, element -> Int in
            return acc + index
        }
        assertThat(actual, equalTo(6))
        actual = sut.reduceIndexed(initial: 3) { acc, index, element -> Int in
            return acc + index
        }
        assertThat(actual, equalTo(9))
        actual = sut.reduceIndexed(initial: 0) { acc, index, element -> Int in
            return acc + element
        }
        assertThat(actual, equalTo(12))
        actual = sut.reduceIndexed(initial: 2) { acc, index, element -> Int in
            return acc + element
        }
        assertThat(actual, equalTo(14))
        actual = sut.reduceIndexed(initial: 1) { acc, index, element -> Int in
            return acc + element + index
        }
        assertThat(actual, equalTo(19))
    }
}
