//
//  UIImageExtension.swift
//  PMRCloud
//
//  Created by Woraphot Chokratanasombat on 31/8/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import UIKit

public extension UIImage {
    /// Resize image to specified maxSize with preserved aspect ratio
    /// - Parameter maxSize: Max image size either width or height
    /// - Returns: Resized image
    func resize(maxSize: CGFloat) -> UIImage {
        return resize(size: resizeSize(maxSize))
    }
    private func resizeSize(_ maxSize: CGFloat) -> CGSize {
        let horizontalRatio = maxSize / self.size.width
        let verticalRatio = maxSize / self.size.height
        
        let ratio = min(horizontalRatio, verticalRatio)
        return CGSize(width: self.size.width * ratio, height: self.size.height * ratio)
    }
    
    /// Resize image to specified size
    /// - Parameter size: width and height of new image
    /// - Returns: Resized image
    func resize(size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        if #available(iOS 10.0, *) {
            let renderFormat = UIGraphicsImageRendererFormat.default().apply {
                $0.opaque = false
            }
            let renderer = UIGraphicsImageRenderer(size: size, format: renderFormat)
            return renderer.image { _ in self.draw(in: rect) }
        } else {
            UIGraphicsBeginImageContextWithOptions(size, true, 0)
            self.draw(in: rect)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return newImage
        }
    }
}
