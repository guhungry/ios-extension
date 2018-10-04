//
// Created by Woraphot Chokratanasombat on 6/9/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

/// Kotlinize
public protocol KotlinApply {}
public extension KotlinApply {
    func apply(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject : KotlinApply {}

public extension NSObjectProtocol {
    public var className: String {
        return String(describing: Self.self)
    }
}
