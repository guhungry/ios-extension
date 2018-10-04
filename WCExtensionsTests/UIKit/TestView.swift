//
//  TestView.swift
//  WCExtensionsTests
//
//  Created by Woraphot Chokratanasombat on 5/10/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import UIKit

class TestView: UIView {
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        loadFromNib { self.contentView }
    }
}
