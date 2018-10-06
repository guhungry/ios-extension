# iOS Extensions
[![Build Status](https://travis-ci.org/guhungry/ios-extension.svg?branch=master)](https://travis-ci.org/guhungry/ios-extension)
[![codecov](https://codecov.io/gh/guhungry/ios-extension/branch/master/graph/badge.svg)](https://codecov.io/gh/guhungry/ios-extension)
[![LICENSE](https://img.shields.io/cocoapods/l/WCExtensions.svg?style=flat)](https://github.com/guhungry/ios-extension/blob/master/LICENSE)
[![Platform compatible](https://img.shields.io/cocoapods/p/WCExtensions.svg?style=flat)](https://cocoapods.org/pods/WCExtensions)

Swift extension for Foundation or UIKit

## Download
Install using CocoaPods, add dependency in `Podfile`:
```ruby
pod 'WCExtensions', '~> 0.0.0'
```
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/WCExtensions.svg?style=flat)](https://cocoapods.org/pods/WCExtensions)

## Examples

### Import library
```swift
import WCExtensions
```

### Collection
```swift
// Get Element
[1, 3, 5].getOrNil(4) // nil
[1, 3, 5].getOr(4, else: 15) // 15
[1, 2, 3, 4, 5].count { $0 > 3 } // 2

// Loop With Index
[1, 3, 5].forEachIndexed { index, item in ... }
[1, 3, 5].firstIndexed { index, item in ... }
[1, 3, 5].mapIndexed { index, item in ... }
[1, 3, 5].filterIndexed { index, item in ... }
[1, 3, 5].filterNot { item in ... }
[1, 3, 5].filterIndexedNot { index, item in ... }
[1, 3, 5].reduceIndexed(initial: 0) { accmulator, index, item in ... }

// Validation
[1, 3, 5].all { item in ... }
[1, 3, 5].allIndexed { index, item in ... }
[1, 3, 5].any { item in ... }
[1, 3, 5].anyIndexed { index, item in ... }
[1, 3, 5].none { item in ... }
[1, 3, 5].noneIndexed { index, item in ... }
[1, 3, 5].isNotEmpty // true

// Optional
let optional: [Int]? = nil
optional.isNilOrEmpty() // true
optional.toArray() // []

```

### Kotlinize
```swift
let object = SomeObject().apply {
    $0.someprop1 = "Example"
    $0.someprop2 = 1
}
print(object.someprop1, object.someprop2) // Example 1

let value = object.let {
    return $0.someprop2 + 2
}
print(object.someprop2, value) // 1 3
```

### Optional
```swift
let optional: Int? = nil
optional.or(3) // 3
optional.isNil() // true
```

### String
```swift
// Substring
"01🤐345"[1...3] // 1🤐3
"01🤐345"[1..<3] // 1🤐
"01🤐345"[2...] // 🤐345
"01🤐345"[..<3] // 01🤐
"01🤐345"[...3] // 01🤐3

// Conversion
"44".toInt() // 44
"invalid".toInt(or: 6) // 6

// Format
"%@ %d %f".format("test", 1, 5.0) // test 1 5.000000
"%@ %d %f".format(arguments: ["arguments", 5, 1.0]) // arguments 5 1.000000

// Validation
"     ".isBlank() // true
"  dsf   ".isNotBlank() // true

// Optional
let optional: String? = nil
optional.orEmpty() // ""
optional.isNilOrBlank() // true
```
