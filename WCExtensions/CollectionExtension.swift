//
//  ArrayExtension.swift
//  WCExtensions
//
//  Created by Woraphot Chokratanasombat on 4/9/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

public extension Collection where Index == Int {
    public func getOrNull(_ position: Int) -> Element?  {
        guard position < count else { return nil }
        return self[position]
    }
}

public extension Collection {
    public func forEachIndexed(_ action: (Int, Element) -> Void) {
        enumerated().forEach(action)
    }
    
    public func mapIndexed<R>(_ transform: (Int, Element) -> R) -> [R] {
        return enumerated().map(transform)
    }

    public func all(_ predicate: (Element) -> Bool) -> Bool {
        for element in self { if (!predicate(element)) { return false } }
        return true
    }

    public func any(_ predicate: (Element) -> Bool) -> Bool {
        for element in self { if (predicate(element)) { return true } }
        return false
    }
}
