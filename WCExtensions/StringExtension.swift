//
// Created by Woraphot Chokratanasombat on 31/8/2018 AD.
// Copyright (c) 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

public extension String {
    subscript (bounds: ClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    subscript (bounds: PartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        return String(self[start...])
    }
    
    subscript (bounds: PartialRangeUpTo<Int>) -> String {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[..<end])
    }
    
    subscript (bounds: PartialRangeThrough<Int>) -> String {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[...end])
    }
}

public extension String {
    func format(_ arguments: CVarArg...) -> String {
        return format(arguments: arguments)
    }

    func format(arguments: [CVarArg]) -> String {
        return String(format: self, arguments: arguments)
    }
}

public extension Optional where Wrapped == String {
    func isNilOrBlank() -> Bool {
        return self == nil || self!.isBlank()
    }
}

public extension Optional where Wrapped == String {
    func orEmpty() -> String {
        return self ?? ""
    }
}

public extension String {
    func isBlank() -> Bool {
        return trim().isEmpty
    }

    func isNotBlank() -> Bool {
        return !isBlank()
    }
}

public extension String {
    // toInt()
    func toInt() -> Int? {
        return Int(self)
    }
    
    func toInt(or: Int) -> Int {
        return toInt() ?? or
    }

    // toDouble()
    func toDouble() -> Double? {
        return Double(self)
    }

    func toDouble(or: Double) -> Double {
        return toDouble() ?? or
    }

    /// Returns a string having leading and trailing whitespace removed.
    func trim() -> String {
        return trimmingCharacters(in: .whitespaces)
    }
}
