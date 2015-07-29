//
//  HVAlignmentDemoView.swift
//  FFAutoLayout iOS Examples
//
//  Created by wei_jingyun on 15/6/29.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit
import FFAutoLayout

class HVAlignmentDemoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 上左
        let topBtn = UIButton(title: "上", bgColor: UIColor.redColor())
        addSubview(topBtn)
//        topBtn.ff_edgesView(UIedgeView().more(ff_tlbr.top | ff_tlbr.left | ff_tlbr.right, v: self).topSet(64).height(50))
        topBtn.ff_edgesView(UIedgeView().more(tlbr: ff_tlbr.unbottom, v: self).topSet(64).height(50))
        
        // 除了下边其它三边都使用 self 为参考视图
//        topBtn.ff_edgesView(UIedgeView(t: 64, l: 0, b: 0, r: 0).more(ff_tlbr.unbottom , v: self).height(50))
        
        let leftBtn = UIButton(title: "左", bgColor: UIColor.orangeColor())
        addSubview(leftBtn)
        leftBtn.ff_edgesView(UIedgeView().more(tlbr: ff_tlbr.unright, v: self).topSet(64).width(30))
        
        // 右下
        let rightBtn = UIButton(title: "右", bgColor: UIColor.blueColor())
        addSubview(rightBtn)
        rightBtn.ff_edgesView(UIedgeView().more(tlbr: ff_tlbr.unleft, v: self).topSet(64).width(30))

        let bottomBtn = UIButton(title: "下", bgColor: UIColor.brownColor())
        addSubview(bottomBtn)
        bottomBtn.ff_edgesView(UIedgeView().more(tlbr: ff_tlbr.untop, v: self).height(50))
      
   
        let demo1 = UIButton(title: "左上固定大小", bgColor: UIColor.redColor())
        addSubview(demo1)
        demo1.ff_edgesView(UIedgeView().top(topBtn, c: 20).left(leftBtn, c: 20).size(CGSize(width: 80, height: 80)))

        let demo2 = UIButton(title: "右上固定大小", bgColor: UIColor.redColor())
        addSubview(demo2)
        demo2.ff_edgesView(UIedgeView().top(topBtn, c: 20).right(rightBtn, c: 20).size(80, h: 80))
        
        let demo3 = UIButton(title: "左下固定大小", bgColor: UIColor.redColor())
        addSubview(demo3)
        demo3.ff_edgesView(UIedgeView().left(leftBtn, c: 30).bottom(bottomBtn, c: 30).size(70, h: 50))

        let demo4 = UIButton(title: "右下上固定大小", bgColor: UIColor.redColor())
        addSubview(demo4)
       let con4s = demo4.ff_edgesView(UIedgeView().bottom(bottomBtn, c: 30).right(rightBtn, c: 50).size(100, h: 100))
        
        let hConstraint = demo4.ff_Constraint(con4s!, attribute: NSLayoutAttribute.Height)!
        hConstraint.constant = 50 ;
        let wConstraint = demo4.ff_Constraint(con4s!, attribute: NSLayoutAttribute.Width)!
        wConstraint.constant = 60 ;

        let demo5 = UIButton(title: "四边距离", bgColor: UIColor.redColor())
        addSubview(demo5)
        let con5s = demo5.ff_edgesView(UIedgeView().top(topBtn, c: 50).bottom(bottomBtn, c: 50 ).left(leftBtn, c: 50 ).right(rightBtn, c: 50 ))
        
       let leftConstraint = demo5.ff_Constraint(con5s!, attribute: NSLayoutAttribute.Left)!
        leftConstraint.constant = 100 ;
        
       let rightConstraint = demo5.ff_Constraint(con5s!, attribute: NSLayoutAttribute.Right)!
        rightConstraint.constant = -100 ;

       let topConstraint = demo5.ff_Constraint(con5s!, attribute: NSLayoutAttribute.Top)!
        topConstraint.constant = 100 ;
        
       let bottomConstraint = demo5.ff_Constraint(con5s!, attribute: NSLayoutAttribute.Bottom)!
        bottomConstraint.constant = -100 ;
        

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
