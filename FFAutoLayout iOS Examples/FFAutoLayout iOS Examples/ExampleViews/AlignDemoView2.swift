//
//  AlignDemoView2.swift
//  FFAutoLayout
//
//  Created by 刘凡 on 15/6/28.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit
import FFAutoLayout

class AlignDemoView2: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.whiteColor()
        
        let btnSize = CGSize(width: 40, height: 30)
        // 中心参照按钮
        let centerBtn = UIButton(title: "中心按钮")
        addSubview(centerBtn)
        centerBtn.ff_AlignInner(ff_AlignType.CenterCenter, referView: self, size: CGSize(width: 150, height: 150))
        
        // 水平右上
        let htrBtn = UIButton(title: "右上", bgColor: UIColor.orangeColor())
        addSubview(htrBtn)
        htrBtn.ff_AlignHorizontal(ff_AlignType.TopRight, referView: centerBtn, size: btnSize, offset: CGPoint(x: 8, y: 0))
        
        // 水平右中
        let hcrBtn = UIButton(title: "右中", bgColor: UIColor.orangeColor())
        addSubview(hcrBtn)
        hcrBtn.ff_AlignHorizontal(ff_AlignType.CenterRight, referView: centerBtn, size: btnSize, offset: CGPoint(x: 8, y: 0))
        
        // 水平右下
        let hbrBtn = UIButton(title: "右下", bgColor: UIColor.orangeColor())
        addSubview(hbrBtn)
        hbrBtn.ff_AlignHorizontal(ff_AlignType.BottomRight, referView: centerBtn, size: btnSize, offset: CGPoint(x: 8, y: 0))
        
        // 水平左上
        let htlBtn = UIButton(title: "左上", bgColor: UIColor.orangeColor())
        addSubview(htlBtn)
        htlBtn.ff_AlignHorizontal(ff_AlignType.TopLeft, referView: centerBtn, size: btnSize, offset: CGPoint(x: -8, y: 0))
        
        // 水平左中
        let hclBtn = UIButton(title: "左中", bgColor: UIColor.orangeColor())
        addSubview(hclBtn)
        hclBtn.ff_AlignHorizontal(ff_AlignType.CenterLeft, referView: centerBtn, size: btnSize, offset: CGPoint(x: -8, y: 0))

        // 水平左下
        let hblBtn = UIButton(title: "左下", bgColor: UIColor.orangeColor())
        addSubview(hblBtn)
        hblBtn.ff_AlignHorizontal(ff_AlignType.BottomLeft, referView: centerBtn, size: btnSize, offset: CGPoint(x: -8, y: 0))
        
        // MARK: 垂直上下布局
        // 垂直左上
        let vtlBtn = UIButton(title: "左上", bgColor: UIColor.orangeColor())
        addSubview(vtlBtn)
        vtlBtn.ff_AlignVertical(ff_AlignType.TopLeft, referView: centerBtn, size: btnSize, offset: CGPoint(x: 0, y: -8))
        
        // 垂直中上
        let vtcBtn = UIButton(title: "中上", bgColor: UIColor.orangeColor())
        addSubview(vtcBtn)
        vtcBtn.ff_AlignVertical(ff_AlignType.TopCenter, referView: centerBtn, size: btnSize, offset: CGPoint(x: 0, y: -8))
        
        // 垂直右上
        let vtrBtn = UIButton(title: "右上", bgColor: UIColor.orangeColor())
        addSubview(vtrBtn)
        vtrBtn.ff_AlignVertical(ff_AlignType.TopRight, referView: centerBtn, size: btnSize, offset: CGPoint(x: 0, y: -8))
        
        // 垂直左下
        let vblBtn = UIButton(title: "左下", bgColor: UIColor.orangeColor())
        addSubview(vblBtn)
        vblBtn.ff_AlignVertical(ff_AlignType.BottomLeft, referView: centerBtn, size: btnSize, offset: CGPoint(x: 0, y: 8))
        
        // 垂直中下
        let vbcBtn = UIButton(title: "中下", bgColor: UIColor.orangeColor())
        addSubview(vbcBtn)
        vbcBtn.ff_AlignVertical(ff_AlignType.BottomCenter, referView: centerBtn, size: btnSize, offset: CGPoint(x: 0, y: 8))

        // 垂直右下
        let vbrBtn = UIButton(title: "右下", bgColor: UIColor.orangeColor())
        addSubview(vbrBtn)
        vbrBtn.ff_AlignVertical(ff_AlignType.BottomRight, referView: centerBtn, size: btnSize, offset: CGPoint(x: 0, y: 8))
        
        // MARK: - 内部按钮
        // 内部按钮
        // 内部左上
        let itlBtn = UIButton(title: "左上", bgColor: UIColor.whiteColor())
        addSubview(itlBtn)
        itlBtn.ff_AlignInner(ff_AlignType.TopLeft, referView: centerBtn, size: btnSize, offset: CGPoint(x: 8, y: 8))
        
        // 内部中上
        let itcBtn = UIButton(title: "中上", bgColor: UIColor.whiteColor())
        addSubview(itcBtn)
        itcBtn.ff_AlignInner(ff_AlignType.TopCenter, referView: centerBtn, size: btnSize, offset: CGPoint(x: 0, y: 8))

        // 内部右上
        let itrBtn = UIButton(title: "右上", bgColor: UIColor.whiteColor())
        addSubview(itrBtn)
        itrBtn.ff_AlignInner(ff_AlignType.TopRight, referView: centerBtn, size: btnSize, offset: CGPoint(x: -8, y: 8))
        
        // 内部左中
        let iclBtn = UIButton(title: "左中", bgColor: UIColor.whiteColor())
        addSubview(iclBtn)
        iclBtn.ff_AlignInner(ff_AlignType.CenterLeft, referView: centerBtn, size: btnSize, offset: CGPoint(x: 8, y: 0))
        
        // 内部中中
        let iccBtn = UIButton(title: "中中", bgColor: UIColor.whiteColor())
        addSubview(iccBtn)
        iccBtn.ff_AlignInner(ff_AlignType.CenterCenter, referView: centerBtn, size: btnSize, offset: CGPoint(x: 0, y: 0))
        
        // 内部右中
        let icrBtn = UIButton(title: "右中", bgColor: UIColor.whiteColor())
        addSubview(icrBtn)
        icrBtn.ff_AlignInner(ff_AlignType.CenterRight, referView: centerBtn, size: btnSize, offset: CGPoint(x: -8, y: 0))
        
        // 内部左下
        let iblBtn = UIButton(title: "左下", bgColor: UIColor.whiteColor())
        addSubview(iblBtn)
        iblBtn.ff_AlignInner(ff_AlignType.BottomLeft, referView: centerBtn, size: btnSize, offset: CGPoint(x: 8, y: -8))
        
        // 内部中下
        let ibcBtn = UIButton(title: "中下", bgColor: UIColor.whiteColor())
        addSubview(ibcBtn)
        ibcBtn.ff_AlignInner(ff_AlignType.BottomCenter, referView: centerBtn, size: btnSize, offset: CGPoint(x: 0, y: -8))

        // 垂直右下
        let ibrBtn = UIButton(title: "右下", bgColor: UIColor.whiteColor())
        addSubview(ibrBtn)
        ibrBtn.ff_AlignInner(ff_AlignType.BottomRight, referView: centerBtn, size: btnSize, offset: CGPoint(x: -8, y: -8))
        
    }
   
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
