//
//  UIButton+Extension.swift
//  FFAutoLayout
//
//  Created by 刘凡 on 15/6/27.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit

extension UIButton {

    convenience init(title: String) {
        self.init(frame: CGRectZero)
        
        setTitle(title, forState: UIControlState.Normal)
        setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        backgroundColor = UIColor.lightGrayColor()
        titleLabel?.font = UIFont.systemFontOfSize(11)
    }
    
    convenience init(title: String, bgColor: UIColor) {
        self.init(frame: CGRectZero)
        
        setTitle(title, forState: UIControlState.Normal)
        setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        backgroundColor = bgColor
        titleLabel?.font = UIFont.systemFontOfSize(11)
    }
}
