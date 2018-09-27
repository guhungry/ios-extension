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

# Collection
```swift
// Get Element
[1, 3, 5].getOrNil(4)
[1, 3, 5].getOr(4, else: 15)

// Loop With Index
[1, 3, 5].forEachIndexed { index, item in ... }
[1, 3, 5].firstIndexed { index, item in ... }
[1, 3, 5].mapIndexed { index, item in ... }
[1, 3, 5].filterIndexed { index, item in ... }
[1, 3, 5].reduceIndexed(initial: 0) { accmulator, index, item in ... }

// Validation
[1, 3, 5].all { item in ... }
[1, 3, 5].allIndexed { index, item in ... }
[1, 3, 5].any { item in ... }
[1, 3, 5].anyIndexed { index, item in ... }
[1, 3, 5].isNotEmpty

// Optional
val optional: [Int]? = nil
optional.isNilOrEmpty()
optional.toArray()

```
