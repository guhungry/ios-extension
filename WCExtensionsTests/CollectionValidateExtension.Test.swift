//
//  CollectionValidateExtensionTest.swift
//  WCExtensionsTests
//
//  Created by Woraphot Chokratanasombat on 21/9/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import XCTest
import Hamcrest
@testable import WCExtensions

class CollectionValidateExtensionTest: XCTestCase {
    func testAny_WhenEmpty_ShouldReturnFalse() {
        assertThat([].any { false }, equalTo(false))
        assertThat([].any { true }, equalTo(false))
    }
    
    func testAny_WhenPredicateAllFalse_ShouldReturnFalse() {
        assertThat([0, 3, 6].any { _ in return false }, equalTo(false))
        assertThat([0, 3, 6].any { $0 == 5 }, equalTo(false))
        assertThat([0].any { $0 == 5 }, equalTo(false))
    }
    
    func testAny_WhenPredicateSomeTrue_ShouldReturnTrue() {
        assertThat([0, 3, 6, 5].any { $0 == 5 }, equalTo(true))
        assertThat([3, 5, 2, 3].any { $0 == 5 }, equalTo(true))
        assertThat([5, 1, 2, 3].any { $0 == 5 }, equalTo(true))
        assertThat([5, 1, 2, 3].any { _ in return true }, equalTo(true))
    }
    
    func testAll_WhenEmpty_ShouldReturnFalse() {
        assertThat([].all { false }, equalTo(true))
        assertThat([].all { true }, equalTo(true))
    }
    
    func testAll_WhenPredicateAllFalse_ShouldReturnFalse() {
        assertThat([0, 3, 6].all { _ in return false }, equalTo(false))
        assertThat([0, 3, 6].all { $0 == 5 }, equalTo(false))
        assertThat([0].all { $0 == 5 }, equalTo(false))
    }
    
    func testAll_WhenPredicateSomeTrue_ShouldReturnFalse() {
        assertThat([0, 3, 6, 5].all { $0 == 5 }, equalTo(false))
        assertThat([3, 5, 2, 3].all { $0 < 5 }, equalTo(false))
        assertThat([5, 1, 2, 3].all { $0 > 2 }, equalTo(false))
        assertThat([5, 1, 2, 3].all { $0 > 0 }, equalTo(true))
    }
    
    func testAll_WhenPredicateAllTrue_ShouldReturnTrue() {
        assertThat([1, 3, 6, 5].all { $0 > 0 }, equalTo(true))
        assertThat([3, 5, 2, 3].all { $0 < 6 }, equalTo(true))
        assertThat([5, 1, 2, 3].all { $0 != 4 }, equalTo(true))
    }
    
    func testIsNotEmpty_ShouldReturnCorrectly() {
        assertThat([].isNotEmpty, equalTo(false))
        assertThat([3, 5, 2, 3].isNotEmpty, equalTo(true))
        assertThat([3].isNotEmpty, equalTo(true))
    }
}
