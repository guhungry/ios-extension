//
// Created by Woraphot Chokratanasombat on 4/9/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

public extension Optional {
    public func isNil() -> Bool {
        return self == nil
    }
    
    public func or(_ other: Wrapped) -> Wrapped {
        return self ?? other
    }
}
