//
//  UIImageExtensionTest.swift
//  WCExtensionsTests
//
//  Created by Woraphot Chokratanasombat on 3/9/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import XCTest
import Hamcrest
@testable import WCExtensions

class UIImageExtensionTest: XCTestCase {
    var sut: UIImage!
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func testResize100x5Image_WithMaxSize500_ShouldHaveCorrectDimension() {
        sut = imageFromName("horizontal")?.resize(maxSize: 500)
        
        assertThat(sut.size, equalTo(CGSize(width: 500, height: 25)))
    }
    
    func testResize5x100Image_WithMaxSize500_ShouldHaveCorrectDimension() {
        sut = imageFromName("vertical")?.resize(maxSize: 500)
        
        assertThat(sut.size, equalTo(CGSize(width: 25, height: 500)))
    }
    
    func testResize100x5Image_WithSize_ShouldHaveCorrectDimension() {
        let target = CGSize(width: 456, height: 23)
        sut = imageFromName("horizontal")?.resize(size: target)
        
        assertThat(sut.size, equalTo(target))
    }
    
    func testResize5x100Image_WithSize_ShouldHaveCorrectDimension() {
        let target = CGSize(width: 234, height: 582)
        sut = imageFromName("vertical")?.resize(size: target)
        
        assertThat(sut.size, equalTo(target))
    }
    
    private func imageFromName(_ name: String) -> UIImage? {
        return UIImage(named: name, in: Bundle.init(for: UIImageExtensionTest.self), compatibleWith: nil)
    }
}
