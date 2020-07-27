//
//  ArrayExtension.swift
//  WCExtensions
//
//  Created by Woraphot Chokratanasombat on 4/9/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

public extension Collection {
    func getOrNil(_ index: Index) -> Element?  {
        return indices.contains(index) ? self[index] : nil
    }

    func getOr(_ index: Index, else defaultValue: Element) -> Element  {
        return indices.contains(index) ? self[index] : defaultValue
    }

    func count(_ predicate: (Element) -> Bool) -> Int {
        return reduce(0) { acc, it in predicate(it) ? acc + 1 : acc }
    }
}

////////
/// Loop
////////
public extension Collection {
    func forEachIndexed(_ action: (Int, Element) -> Void) {
        enumerated().forEach(action)
    }

    func mapIndexed<R>(_ transform: (Int, Element) -> R) -> [R] {
        return enumerated().map(transform)
    }

    func firstIndexed(_ predicate: (Int, Element) -> Bool) -> (offset: Int, element: Element)? {
        return enumerated().first(where: predicate)
    }

    func filterIndexed(_ predicate: (Int, Element) -> Bool) -> [(offset: Int, element: Element)] {
        return enumerated().filter(predicate)
    }

    func filterNot(_ predicate: (Element) -> Bool) -> [Element] {
        return filter { !predicate($0) }
    }

    func filterIndexedNot(_ predicate: (Int, Element) -> Bool) -> [(offset: Int, element: Element)] {
        return enumerated().filter { index, it in !predicate(index, it) }
    }

    func reduceIndexed<R>(initial: R, reducer: (R, Int, Element) -> R) -> R {
        return enumerated().reduce(initial) { acc, it in reducer(acc, it.offset, it.element) }
    }
}

public extension Collection where Element: OptionalType {
    func filterNotNil() -> [Element.Wrapped] {
        return compactMap { $0.map { $0 } }
    }
}

////////////
/// Validate
////////////
public extension Collection {
    func all(_ predicate: (Element) -> Bool) -> Bool {
        for it in self {
            if (!predicate(it)) {
                return false
            }
        }
        return true
    }

    func any(_ predicate: (Element) -> Bool) -> Bool {
        for it in self {
            if (predicate(it)) {
                return true
            }
        }
        return false
    }

    func none(_ predicate: (Element) -> Bool) -> Bool {
        for it in self {
            if (predicate(it)) {
                return false
            }
        }
        return true
    }

    func allIndexed(_ predicate: (Int, Element) -> Bool) -> Bool {
        for it in enumerated() {
            if (!predicate(it.offset, it.element)) {
                return false
            }
        }
        return true
    }

    func anyIndexed(_ predicate: (Int, Element) -> Bool) -> Bool {
        for it in enumerated() {
            if (predicate(it.offset, it.element)) {
                return true
            }
        }
        return false
    }

    func noneIndexed(_ predicate: (Int, Element) -> Bool) -> Bool {
        for it in enumerated() {
            if (predicate(it.offset, it.element)) {
                return false
            }
        }
        return true
    }

    var isNotEmpty: Bool {
        return !isEmpty
    }
}

public extension Optional where Wrapped: Collection {
    func isNilOrEmpty() -> Bool {
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
    func toArray() -> [Wrapped.Iterator.Element] {
        return self?.toArray() ?? []
    }
}
