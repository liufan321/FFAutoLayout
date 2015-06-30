//
//  InnerAlignView.swift
//  FFAutoLayout
//
//  Created by 刘凡 on 15/6/27.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit
import FFAutoLayout

class AlignDemoView1: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.whiteColor()
        
        let btnSize = CGSize(width: 80, height: 30)
        let followSize = CGSize(width: 100, height: 30)
        
        // 左上
        let tlButton1 = UIButton(title: "Top Left")
        addSubview(tlButton1)
        tlButton1.ff_AlignInner(type: ff_AlignType.TopLeft, referView: self, size: btnSize, offset: CGPointMake(8, 64))
        
        let tlButton2 = UIButton(title: "V Bottom Left", bgColor: UIColor.orangeColor())
        addSubview(tlButton2)
        tlButton2.ff_AlignVertical(type: ff_AlignType.BottomLeft, referView: tlButton1, size: followSize, offset: CGPointMake(0, 8))

        // 中上
        let tcButton1 = UIButton(title: "Top Center")
        addSubview(tcButton1)
        tcButton1.ff_AlignInner(type: ff_AlignType.TopCenter, referView: self, size: btnSize, offset: CGPointMake(0, 64))
        
        let tcButton2 = UIButton(title: "V Bottom Center", bgColor: UIColor.orangeColor())
        addSubview(tcButton2)
        tcButton2.ff_AlignVertical(type: ff_AlignType.BottomCenter, referView: tcButton1, size: followSize, offset: CGPointMake(0, 8))
        
        // 右上
        let trButton1 = UIButton(title: "Top Right")
        addSubview(trButton1)
        trButton1.ff_AlignInner(type: ff_AlignType.TopRight, referView: self, size: btnSize, offset: CGPointMake(-8, 64))
        
        let trButton2 = UIButton(title: "V Bottom Right", bgColor: UIColor.orangeColor())
        addSubview(trButton2)
        trButton2.ff_AlignVertical(type: ff_AlignType.BottomRight, referView: trButton1, size: followSize, offset: CGPointMake(0, 8))

        // 左下
        let blButton1 = UIButton(title: "Bottom Left")
        addSubview(blButton1)
        blButton1.ff_AlignInner(type: ff_AlignType.BottomLeft, referView: self, size: btnSize, offset: CGPointMake(8, -8))
        
        let blButton2 = UIButton(title: "V Top Left", bgColor: UIColor.orangeColor())
        addSubview(blButton2)
        blButton2.ff_AlignVertical(type: ff_AlignType.TopLeft, referView: blButton1, size: followSize, offset: CGPointMake(0, -8))
        
        // 中下
        let bcButton1 = UIButton(title: "Bottom Center")
        addSubview(bcButton1)
        bcButton1.ff_AlignInner(type: ff_AlignType.BottomCenter, referView: self, size: btnSize, offset: CGPointMake(0, -8))
        
        let bcButton2 = UIButton(title: "V Top Center", bgColor: UIColor.orangeColor())
        addSubview(bcButton2)
        bcButton2.ff_AlignVertical(type: ff_AlignType.TopCenter, referView: bcButton1, size: followSize, offset: CGPointMake(0, -8))
        
        // 右下
        let brButton1 = UIButton(title: "Bottom Right")
        addSubview(brButton1)
        brButton1.ff_AlignInner(type: ff_AlignType.BottomRight, referView: self, size: btnSize, offset: CGPointMake(-8, -8))
        
        let brButton2 = UIButton(title: "V Top Right", bgColor: UIColor.orangeColor())
        addSubview(brButton2)
        brButton2.ff_AlignVertical(type: ff_AlignType.TopRight, referView: brButton1, size: followSize, offset: CGPointMake(0, -8))
        
        // 左中
        let clButton1 = UIButton(title: "Center Left")
        addSubview(clButton1)
        clButton1.ff_AlignInner(type: ff_AlignType.CenterLeft, referView: self, size: btnSize, offset: CGPointMake(8, 0))
        
        let clButton2 = UIButton(title: "V Bottom Left", bgColor: UIColor.orangeColor())
        addSubview(clButton2)
        clButton2.ff_AlignVertical(type: ff_AlignType.BottomLeft, referView: clButton1, size: followSize, offset: CGPointMake(0, 8))
        
        let clButton3 = UIButton(title: "V Top Left", bgColor: UIColor.orangeColor())
        addSubview(clButton3)
        clButton3.ff_AlignVertical(type: ff_AlignType.TopLeft, referView: clButton1, size: followSize, offset: CGPointMake(0, -8))
        
        // 中中
        let ccButton1 = UIButton(title: "Center Center")
        addSubview(ccButton1)
        ccButton1.ff_AlignInner(type: ff_AlignType.CenterCenter, referView: self, size: btnSize, offset: CGPointMake(0, 0))
        
        let ccButton2 = UIButton(title: "V Bottom Center", bgColor: UIColor.orangeColor())
        addSubview(ccButton2)
        ccButton2.ff_AlignVertical(type: ff_AlignType.BottomCenter, referView: ccButton1, size: followSize, offset: CGPointMake(0, 8))
        
        let ccButton3 = UIButton(title: "V Top Center", bgColor: UIColor.orangeColor())
        addSubview(ccButton3)
        ccButton3.ff_AlignVertical(type: ff_AlignType.TopCenter, referView: ccButton1, size: followSize, offset: CGPointMake(0, -8))
        
        // 中右
        let crButton1 = UIButton(title: "Center Right")
        addSubview(crButton1)
        crButton1.ff_AlignInner(type: ff_AlignType.CenterRight, referView: self, size: btnSize, offset: CGPointMake(-8, 0))
        
        let crButton2 = UIButton(title: "V Bottom Right", bgColor: UIColor.orangeColor())
        addSubview(crButton2)
        crButton2.ff_AlignVertical(type: ff_AlignType.BottomRight, referView: crButton1, size: followSize, offset: CGPointMake(0, 8))
        
        let crButton3 = UIButton(title: "V Top Right", bgColor: UIColor.orangeColor())
        addSubview(crButton3)
        crButton3.ff_AlignVertical(type: ff_AlignType.TopRight, referView: crButton1, size: followSize, offset: CGPointMake(0, -8))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
