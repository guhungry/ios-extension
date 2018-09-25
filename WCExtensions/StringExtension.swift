//
// Created by Woraphot Chokratanasombat on 31/8/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

public extension String {
    public subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    public subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}

public extension String {
    public func format(args: CVarArg...) -> String {
        return String(format: self, arguments: args)
    }
}

public extension Optional where Wrapped == String {
    public func isNilOrBlank() -> Bool {
        return self == nil || self!.isBlank()
    }
}

public extension Optional where Wrapped == String {
    public func orEmpty() -> String {
        return self ?? ""
    }
}

public extension String {
    public func isBlank() -> Bool {
        return trimmingCharacters(in: CharacterSet.whitespaces).isEmpty
    }

    public func isNotBlank() -> Bool {
        return !isBlank()
    }
}

public extension String {
    public func toInt() -> Int? {
        return Int(self)
    }
    
    
    public func toInt(or: Int) -> Int {
        return toInt() ?? or
    }
}
