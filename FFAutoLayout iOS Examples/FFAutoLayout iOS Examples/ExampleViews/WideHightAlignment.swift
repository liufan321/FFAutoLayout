//
//  WideHightAlignment.swift
//  FFAutoLayout iOS Examples
//
//  Created by wei_jingyun on 15/7/1.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit
import FFAutoLayout

class WideHightAlignment: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let centerBtn = UIButton(title: "与self中心对齐 ", bgColor: UIColor.redColor())
        addSubview(centerBtn)
        centerBtn.ff_edgesView(UIedgeView().center(self).size(200, h: 200))
        
        let leftTop = UIButton(title: "WH参考redView", bgColor: UIColor.blueColor())
        addSubview(leftTop)
        leftTop.ff_edgesView(UIedgeView().width(centerBtn, m: 0.5).height(centerBtn, m: 0.5).top(self, c: 64).left(self, c: 0))
        
        let rightTop = UIButton(title: "WH与左上等宽高", bgColor: UIColor.blueColor())
        addSubview(rightTop)
        rightTop.ff_edgesView(UIedgeView().size(leftTop).top(self, c: 64).right(self, c: 0))
        
        let rightBottom = UIButton(title: "WH与左上等宽高", bgColor: UIColor.blueColor())
        addSubview(rightBottom)
        rightBottom.ff_edgesView(UIedgeView().size(leftTop).bottom(self, c: 0).right(self, c: 0))
        
        let leftBottom = UIButton(title: "WH与左上等宽高", bgColor: UIColor.blueColor())
        addSubview(leftBottom)
        leftBottom.ff_edgesView(UIedgeView().size(leftTop).bottom(self, c: 0).left(self, c: 0))
        
        // 以下为对齐
        let centerTop = UIButton(title: "centerTop", bgColor: UIColor.blueColor())
        addSubview(centerTop)
        centerTop.ff_edgesView(UIedgeView().centerY(leftTop, c: 0).centerX(centerBtn, c: 0).size(50, h: 50))
        
        let centerleft = UIButton(title: "centerleft", bgColor: UIColor.blueColor())
        addSubview(centerleft)
        centerleft.ff_edgesView(UIedgeView().centerX(leftTop, c: 0).centerY(centerBtn, c: 100).size(50, h: 50))

        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
