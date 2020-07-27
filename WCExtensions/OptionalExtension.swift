//
// Created by Woraphot Chokratanasombat on 4/9/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

public protocol OptionalType {
    associatedtype Wrapped
    func map<U>(_ f: (Wrapped) throws -> U) rethrows -> U?
}

extension Optional: OptionalType {}

public extension Optional {
    func isNil() -> Bool {
        return self == nil
    }
    
    func or(_ other: Wrapped) -> Wrapped {
        return self ?? other
    }
}
