//
// Created by Woraphot Chokratanasombat on 4/9/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

public extension Optional {
    public func isNull() -> Bool {
        return self == nil
    }
    
    public func or(_ default: Wrapped) -> Wrapped {
        return self ?? `default`
    }
}

public extension Optional where Wrapped: Collection {
    public func isNullOrEmpty() -> Bool {
        return isNull() || self!.isEmpty
    }
}
