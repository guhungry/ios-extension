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

class ObjectExtensionTests: XCTestCase {
    fileprivate var sut: TestObject!

    override func tearDown() {
        sut = nil

        super.tearDown()
    }

    func testApply_WhenChangeValue_ShouldChangeValue() {
        sut = TestObject().apply {
            $0.value = "555"
        }

        assertThat(sut.value, equalTo("555"))
        assertThat(sut.apply { _ in }, sameInstance(sut))
    }

    func testLet_WhenReturnNewValue_ShouldBeNewValue() {
        let actual = TestObject().let { (it) -> String in
            return "NewValue" + it.value
        }

        assertThat(actual, equalTo("NewValue235"))
    }

    func testClassName_WhenClassTestObject_ShouldBeTestObject() {
        sut = TestObject()

        assertThat(sut.className, equalTo("TestObject"))
    }
}

fileprivate class TestObject : NSObject {
    fileprivate var value: String = "235"
}
