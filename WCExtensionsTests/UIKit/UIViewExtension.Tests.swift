
//
//  UIViewExtensionTests.swift
//  WCExtensionsTests
//
//  Created by Woraphot Chokratanasombat on 5/10/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import XCTest
import Hamcrest
@testable import WCExtensions

class UIViewExtensionTests: XCTestCase {
    var sut: TestView!

    override func setUp() {
        sut = TestView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
    }

    override func tearDown() {
        sut = nil
    }

    func testLoadFromNib_ShouldLoadViewCorrectly() {
        assertThat(sut, not(nil))
        assertThat(sut.subviews, contains(sut.contentView))
    }

}
