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

    func testAny_WhenEmpty_ShouldReturnFalse() {
        assertThat([].any { return false }, equalTo(false))
        assertThat([].any { return true }, equalTo(false))
    }

    func testAny_WhenPredicateAllFalse_ShouldReturnFalse() {
        assertThat([0, 3, 6].any { _ in return false }, equalTo(false))
        assertThat([0, 3, 6].any { return $0 == 5 }, equalTo(false))
        assertThat([0].any { return $0 == 5 }, equalTo(false))
    }

    func testAny_WhenPredicateSomeTrue_ShouldReturnTrue() {
        assertThat([0, 3, 6, 5].any { return $0 == 5 }, equalTo(true))
        assertThat([3, 5, 2, 3].any { return $0 == 5 }, equalTo(true))
        assertThat([5, 1, 2, 3].any { return $0 == 5 }, equalTo(true))
        assertThat([5, 1, 2, 3].any { _ in return true }, equalTo(true))
    }

    func testAll_WhenEmpty_ShouldReturnFalse() {
        assertThat([].all { return false }, equalTo(true))
        assertThat([].all { return true }, equalTo(true))
    }

    func testAll_WhenPredicateAllFalse_ShouldReturnFalse() {
        assertThat([0, 3, 6].all { _ in return false }, equalTo(false))
        assertThat([0, 3, 6].all { return $0 == 5 }, equalTo(false))
        assertThat([0].all { return $0 == 5 }, equalTo(false))
    }

    func testAll_WhenPredicateSomeTrue_ShouldReturnFalse() {
        assertThat([0, 3, 6, 5].all { return $0 == 5 }, equalTo(false))
        assertThat([3, 5, 2, 3].all { return $0 < 5 }, equalTo(false))
        assertThat([5, 1, 2, 3].all { return $0 > 2 }, equalTo(false))
        assertThat([5, 1, 2, 3].all { _ in return true }, equalTo(true))
    }

    func testAll_WhenPredicateAllTrue_ShouldReturnTrue() {
        assertThat([1, 3, 6, 5].all { return $0 > 0 }, equalTo(true))
        assertThat([3, 5, 2, 3].all { return $0 < 6 }, equalTo(true))
        assertThat([5, 1, 2, 3].all { _ in return true }, equalTo(true))
    }
}
