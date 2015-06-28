//
//  HorizontalAlignmentDemoView.swift
//  FFAutoLayout
//
//  Created by 刘凡 on 15/6/28.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit
import FFAutoLayout

class HorizontalAlignmentDemoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.whiteColor()
        
        let redView = UIView()
        redView.backgroundColor = UIColor.redColor()
        addSubview(redView)
        
        let greenView = UIView()
        greenView.backgroundColor = UIColor.greenColor()
        addSubview(greenView)
        
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blueColor()
        addSubview(blueView)
        
        ff_HorizontalTile([redView, greenView, blueView], insets: UIEdgeInsets(top: 74, left: 10, bottom: 10, right: 10))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
