//
//  ArrayExtension.swift
//  WCExtensions
//
//  Created by Woraphot Chokratanasombat on 4/9/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

public extension Collection {
    public func getOrNil(_ index: Index) -> Element?  {
        return indices.contains(index) ? self[index] : nil
    }

    public func getOr(_ index: Index, else defaultValue: Element) -> Element  {
        return indices.contains(index) ? self[index] : defaultValue
    }

    public func count(_ predicate: (Element) -> Bool) -> Int {
        var result: Int = 0
        forEach { if (predicate($0)) {
            result += 1
        }}
        return result
    }
}

////////
/// Loop
////////
public extension Collection {
    public func forEachIndexed(_ action: (Int, Element) -> Void) {
        enumerated().forEach(action)
    }

    public func mapIndexed<R>(_ transform: (Int, Element) -> R) -> [R] {
        return enumerated().map(transform)
    }

    public func firstIndexed(_ predicate: (Int, Element) -> Bool) -> (offset: Int, element: Element)? {
        return enumerated().first(where: predicate)
    }

    public func filterIndexed(_ predicate: (Int, Element) -> Bool) -> [(offset: Int, element: Element)] {
        return enumerated().filter(predicate)
    }

    public func filterNot(_ predicate: (Element) -> Bool) -> [Element] {
        return filter { !predicate($0) }
    }

    public func filterIndexedNot(_ predicate: (Int, Element) -> Bool) -> [(offset: Int, element: Element)] {
        return enumerated().filter { index, element in !predicate(index, element) }
    }

    public func reduceIndexed<R>(initial: R, reducer: (R, Int, Element) -> R) -> R {
        return enumerated().reduce(initial, { acc, element -> R in
            let (offset, element) = element
            return reducer(acc, offset, element)
        })
    }
}

////////////
/// Validate
////////////
public extension Collection {
    public func all(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if (!predicate(element)) {
                return false
            }
        }
        return true
    }

    public func any(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if (predicate(element)) {
                return true
            }
        }
        return false
    }

    public func none(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if (predicate(element)) {
                return false
            }
        }
        return true
    }

    public func allIndexed(_ predicate: (Int, Element) -> Bool) -> Bool {
        for element in enumerated() {
            if (!predicate(element.offset, element.element)) {
                return false
            }
        }
        return true
    }

    public func anyIndexed(_ predicate: (Int, Element) -> Bool) -> Bool {
        for element in enumerated() {
            if (predicate(element.offset, element.element)) {
                return true
            }
        }
        return false
    }

    public func noneIndexed(_ predicate: (Int, Element) -> Bool) -> Bool {
        for element in enumerated() {
            if (predicate(element.offset, element.element)) {
                return false
            }
        }
        return true
    }

    public var isNotEmpty: Bool {
        return !isEmpty
    }
}

public extension Optional where Wrapped: Collection {
    public func isNilOrEmpty() -> Bool {
        return isNil() || self!.isEmpty
    }
}

////////////////
/// Type Convert
////////////////
public extension Collection {
    func toArray() -> [Element] {
        return self.map { $0 }
    }
}

public extension Optional where Wrapped : Collection {
    public func toArray() -> [Wrapped.Iterator.Element] {
        return self?.toArray() ?? []
    }
}
