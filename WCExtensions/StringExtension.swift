//
// Created by Woraphot Chokratanasombat on 31/8/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

public extension String {
    public subscript (bounds: ClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    public subscript (bounds: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    public subscript (bounds: PartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        return String(self[start...])
    }
    
    public subscript (bounds: PartialRangeUpTo<Int>) -> String {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[..<end])
    }
    
    public subscript (bounds: PartialRangeThrough<Int>) -> String {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[...end])
    }
}

public extension String {
    public func format(_ arguments: CVarArg...) -> String {
        return format(arguments: arguments)
    }

    public func format(arguments: [CVarArg]) -> String {
        return String(format: self, arguments: arguments)
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
    // toInt()
    public func toInt() -> Int? {
        return Int(self)
    }
    
    public func toInt(or: Int) -> Int {
        return toInt() ?? or
    }

    // toDouble()
    public func toDouble() -> Double? {
        return Double(self)
    }

    public func toDouble(or: Double) -> Double {
        return toDouble() ?? or
    }
}
