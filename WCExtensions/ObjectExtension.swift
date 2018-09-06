//
// Created by Woraphot Chokratanasombat on 6/9/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

/// Kotlinize
protocol KotlinApply {}
extension KotlinApply {
    func apply(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject : KotlinApply {}