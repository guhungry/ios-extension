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

class CollectionValidateExtensionTests: XCTestCase {
    /////////
    /// none()
    /////////
    func testNone_WhenEmpty_ShouldReturnTrue() {
        assertThat([].none { false }, equalTo(true))
        assertThat([].none { true }, equalTo(true))
    }

    func testNone_WhenPredicateAllFalse_ShouldReturnTrue() {
        assertThat([0, 3, 6].none { _ in false }, equalTo(true))
        assertThat([0, 3, 6].none { $0 == 5 }, equalTo(true))
        assertThat([0].none { $0 == 5 }, equalTo(true))
    }

    func testNone_WhenPredicateSomeTrue_ShouldReturnFalse() {
        assertThat([0, 3, 6, 5].none { $0 == 5 }, equalTo(false))
        assertThat([3, 5, 2, 3].none { $0 == 5 }, equalTo(false))
        assertThat([5, 1, 2, 3].none { $0 == 5 }, equalTo(false))
        assertThat([5, 1, 2, 3].none { _ in true }, equalTo(false))
    }

    ////////////////
    /// noneIndexed()
    ////////////////
    func testNoneIndexed_WhenEmpty_ShouldReturnTrue() {
        assertThat([].noneIndexed { _, _ in false }, equalTo(true))
        assertThat([].noneIndexed { _, _ in true }, equalTo(true))
    }

    func testNoneIndexed_WhenPredicateAllFalse_ShouldReturnTrue() {
        assertThat([0, 3, 6].noneIndexed { _, _ in false }, equalTo(true))
        assertThat([0, 3, 6].noneIndexed { index, value in value == 5 }, equalTo(true))
        assertThat([0].noneIndexed { index, value in value == 5 }, equalTo(true))
    }

    func testNoneIndexed_WhenPredicateSomeTrue_ShouldReturnFalse() {
        assertThat([0, 3, 6, 5].noneIndexed { index, value in value == 5 }, equalTo(false))
        assertThat([3, 5, 2, 3].noneIndexed { index, value in value == 5 }, equalTo(false))
        assertThat([5, 1, 2, 3].noneIndexed { index, value in value == 5 }, equalTo(false))
        assertThat([5, 1, 2, 3].noneIndexed { index, value in index > -1 }, equalTo(false))
        assertThat([5, 1, 2, 3].noneIndexed { _, _ in true }, equalTo(false))
    }

    /////////
    /// any()
    /////////
    func testAny_WhenEmpty_ShouldReturnFalse() {
        assertThat([].any { false }, equalTo(false))
        assertThat([].any { true }, equalTo(false))
    }

    func testAny_WhenPredicateAllFalse_ShouldReturnFalse() {
        assertThat([0, 3, 6].any { _ in false }, equalTo(false))
        assertThat([0, 3, 6].any { $0 == 5 }, equalTo(false))
        assertThat([0].any { $0 == 5 }, equalTo(false))
    }
    
    func testAny_WhenPredicateSomeTrue_ShouldReturnTrue() {
        assertThat([0, 3, 6, 5].any { $0 == 5 }, equalTo(true))
        assertThat([3, 5, 2, 3].any { $0 == 5 }, equalTo(true))
        assertThat([5, 1, 2, 3].any { $0 == 5 }, equalTo(true))
        assertThat([5, 1, 2, 3].any { _ in true }, equalTo(true))
    }

    ////////////////
    /// anyIndexed()
    ////////////////
    func testAnyIndexed_WhenEmpty_ShouldReturnFalse() {
        assertThat([].anyIndexed { _, _ in false }, equalTo(false))
        assertThat([].anyIndexed { _, _ in true }, equalTo(false))
    }

    func testAnyIndexed_WhenPredicateAllFalse_ShouldReturnFalse() {
        assertThat([0, 3, 6].anyIndexed { _, _ in false }, equalTo(false))
        assertThat([0, 3, 6].anyIndexed { index, value in value == 5 }, equalTo(false))
        assertThat([0].anyIndexed { index, value in value == 5 }, equalTo(false))
    }

    func testAnyIndexed_WhenPredicateSomeTrue_ShouldReturnTrue() {
        assertThat([0, 3, 6, 5].anyIndexed { index, value in value == 5 }, equalTo(true))
        assertThat([3, 5, 2, 3].anyIndexed { index, value in value == 5 }, equalTo(true))
        assertThat([5, 1, 2, 3].anyIndexed { index, value in value == 5 }, equalTo(true))
        assertThat([5, 1, 2, 3].anyIndexed { index, value in index > -1 }, equalTo(true))
        assertThat([5, 1, 2, 3].anyIndexed { _, _ in true }, equalTo(true))
    }

    /////////
    /// all()
    /////////
    func testAll_WhenEmpty_ShouldReturnFalse() {
        assertThat([].all { false }, equalTo(true))
        assertThat([].all { true }, equalTo(true))
    }

    func testAll_WhenPredicateAllFalse_ShouldReturnFalse() {
        assertThat([0, 3, 6].all { _ in false }, equalTo(false))
        assertThat([0, 3, 6].all { $0 == 5 }, equalTo(false))
        assertThat([0].all { $0 == 5 }, equalTo(false))
    }

    func testAll_WhenPredicateSomeTrue_ShouldReturnFalse() {
        assertThat([0, 3, 6, 5].all { $0 == 5 }, equalTo(false))
        assertThat([3, 5, 2, 3].all { $0 < 5 }, equalTo(false))
        assertThat([5, 1, 2, 3].all { $0 > 2 }, equalTo(false))
        assertThat([5, 1, 2, 3].all { $0 == 3 }, equalTo(false))
    }

    func testAll_WhenPredicateAllTrue_ShouldReturnTrue() {
        assertThat([1, 3, 6, 5].all { $0 > 0 }, equalTo(true))
        assertThat([3, 5, 2, 3].all { $0 < 6 }, equalTo(true))
        assertThat([5, 1, 2, 3].all { $0 != 4 }, equalTo(true))
    }

    ////////////////
    /// allIndexed()
    ////////////////
    func testAllIndexed_WhenEmpty_ShouldReturnFalse() {
        assertThat([].allIndexed { _, _ in false }, equalTo(true))
        assertThat([].allIndexed { _, _ in true }, equalTo(true))
    }

    func testAllIndexed_WhenPredicateAllFalse_ShouldReturnFalse() {
        assertThat([0, 3, 6].allIndexed { _, _ in false }, equalTo(false))
        assertThat([0, 3, 6].allIndexed { index, value in index == 5 }, equalTo(false))
        assertThat([0].allIndexed { index, value in value == 5 }, equalTo(false))
    }

    func testAllIndexed_WhenPredicateSomeTrue_ShouldReturnFalse() {
        assertThat([0, 3, 6, 5].allIndexed { index, value in value == 5 }, equalTo(false))
        assertThat([3, 5, 2, 3].allIndexed { index, value in value < 5 }, equalTo(false))
        assertThat([5, 1, 2, 3].allIndexed { index, value in index > 2 }, equalTo(false))
        assertThat([5, 1, 2, 3].allIndexed { index, value in value == 3 }, equalTo(false))
    }

    func testAllIndexed_WhenPredicateAllTrue_ShouldReturnTrue() {
        assertThat([1, 3, 6, 5].allIndexed { index, value in value > 0 }, equalTo(true))
        assertThat([3, 5, 2, 3].allIndexed { index, value in index < 6 }, equalTo(true))
        assertThat([5, 1, 2, 3].allIndexed { index, value in value != 4 }, equalTo(true))
    }

    ////////////////
    /// isNotEmpty()
    ////////////////
    func testIsNotEmpty_ShouldReturnCorrectly() {
        assertThat([].isNotEmpty, equalTo(false))
        assertThat([3, 5, 2, 3].isNotEmpty, equalTo(true))
        assertThat([3].isNotEmpty, equalTo(true))
    }
}
