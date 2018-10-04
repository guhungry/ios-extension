//
//  UIViewExtension.swift
//  WCExtensions
//
//  Created by Woraphot Chokratanasombat on 4/10/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import UIKit

public extension UIView {
    public func loadFromNib(_ contentView: () -> UIView) {
        let this = type(of: self)
        Bundle(for: this).loadNibNamed(String(describing: this), owner: self, options: nil)
        setContentView(contentView())
    }
    
    private func setContentView(_ view: UIView) {
        addSubview(view)
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
