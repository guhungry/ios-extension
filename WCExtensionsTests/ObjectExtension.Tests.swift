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
}

fileprivate class TestObject : NSObject {
    fileprivate var value: String?
}