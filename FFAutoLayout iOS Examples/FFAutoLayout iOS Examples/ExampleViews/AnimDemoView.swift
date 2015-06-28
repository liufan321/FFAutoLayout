//
//  AnimDemoView.swift
//  FFAutoLayout
//
//  Created by 刘凡 on 15/6/28.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit
import FFAutoLayout

class AnimDemoView: UIView {

    var centerBtn: UIButton?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.whiteColor()
        
        centerBtn = UIButton(title: "Click Me")
        addSubview(centerBtn!)
        let cons = centerBtn!.ff_AlignInner(ff_AlignType.CenterCenter, referView: self, size: CGSize(width: 150, height: 150))
        
        widthConstraint = centerBtn!.ff_Constraint(cons, attribute: NSLayoutAttribute.Width)
        heightConstraint = centerBtn!.ff_Constraint(cons, attribute: NSLayoutAttribute.Height)
        
        centerBtn?.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside)
    }
   
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func click() {
        widthConstraint?.constant = 300
        heightConstraint?.constant = 300
        
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: UIViewAnimationOptions(rawValue: 0), animations: {
            self.layoutIfNeeded()
            }, completion: { _ in
                
                self.widthConstraint?.constant = 150
                self.heightConstraint?.constant = 150
                
                UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: UIViewAnimationOptions(rawValue: 0), animations: {
                    self.layoutIfNeeded()
                    }, completion: { _ in
                        
                })
        })
    }
}
