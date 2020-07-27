//
// Created by Woraphot Chokratanasombat on 6/9/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

/// Kotlinize
public protocol KotlinScopeFunctions {}
public extension KotlinScopeFunctions {
    func apply(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }

    func `let`<R>(_ block: (Self) -> R) -> R {
        return block(self)
    }
}

extension NSObject : KotlinScopeFunctions {}

public extension NSObjectProtocol {
    var className: String {
        return String(describing: Self.self)
    }
}
