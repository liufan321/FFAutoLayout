//
//  DemoViewController.swift
//  FFAutoLayout
//
//  Created by 刘凡 on 15/6/27.
//  Copyright © 2015年 joyios. All rights reserved.
//


import UIKit

///  对齐类型枚举，设置控件相对于父视图的位置
///
///  - TopLeft:      左上
///  - TopRight:     右上
///  - TopCenter:    中上
///  - BottomLeft:   左下
///  - BottomRight:  右下
///  - BottomCenter: 中下
///  - CenterLeft:   左中
///  - CenterRight:  右中
///  - CenterCenter: 中中

public enum ff_AlignType {
    case TopLeft
    case TopRight
    case TopCenter
    case BottomLeft
    case BottomRight
    case BottomCenter
    case CenterLeft
    case CenterRight
    case CenterCenter
    
    private func layoutAttributes(isInner: Bool, isVertical: Bool) -> ff_LayoutAttributes {
        let attributes = ff_LayoutAttributes()
        
        switch self {
        case .TopLeft:
            attributes.horizontals(.Left, to: .Left).verticals(.Top, to: .Top)
            
            if isInner {
                return attributes
            } else if isVertical {
                return attributes.verticals(.Bottom, to: .Top)
            } else {
                return attributes.horizontals(.Right, to: .Left)
            }
        case .TopRight:
            attributes.horizontals(.Right, to: .Right).verticals(.Top, to: .Top)
            
            if isInner {
                return attributes
            } else if isVertical {
                return attributes.verticals(.Bottom, to: .Top)
            } else {
                return attributes.horizontals(.Left, to: .Right)
            }
        case .TopCenter:        // 仅内部 & 垂直参照需要
            attributes.horizontals(.CenterX, to: .CenterX).verticals(.Top, to: .Top)
            return isInner ? attributes : attributes.verticals(.Bottom, to: .Top)
        case .BottomLeft:
            attributes.horizontals(.Left, to: .Left).verticals(.Bottom, to: .Bottom)
            
            if isInner {
                return attributes
            } else if isVertical {
                return attributes.verticals(.Top, to: .Bottom)
            } else {
                return attributes.horizontals(.Right, to: .Left)
            }
        case .BottomRight:
            attributes.horizontals(.Right, to: .Right).verticals(.Bottom, to: .Bottom)
            
            if isInner {
                return attributes
            } else if isVertical {
                return attributes.verticals(.Top, to: .Bottom)
            } else {
                return attributes.horizontals(.Left, to: .Right)
            }
        case .BottomCenter:     // 仅内部 & 垂直参照需要
            attributes.horizontals(.CenterX, to: .CenterX).verticals(.Bottom, to: .Bottom)
            return isInner ? attributes : attributes.verticals(.Top, to: .Bottom)
        case .CenterLeft:       // 仅内部 & 水平参照需要
            attributes.horizontals(.Left, to: .Left).verticals(.CenterY, to: .CenterY)
            return isInner ? attributes : attributes.horizontals(.Right, to: .Left)
        case .CenterRight:      // 仅内部 & 水平参照需要
            attributes.horizontals(.Right, to: .Right).verticals(.CenterY, to: .CenterY)
            return isInner ? attributes : attributes.horizontals(.Left, to: .Right)
        case .CenterCenter:     // 仅内部参照需要
            return ff_LayoutAttributes(horizontal: .CenterX, referHorizontal: .CenterX, vertical: .CenterY, referVertical: .CenterY)
        }
    }
}

extension UIView {
    ///  填充子视图
    ///
    ///  - parameter referView: 参考视图
    ///  - parameter insets:    间距
    public func ff_Fill(referView: UIView, insets: UIEdgeInsets = UIEdgeInsetsZero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var cons = [NSLayoutConstraint]()
        
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-\(insets.left)-[subView]-\(insets.right)-|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["subView" : self])
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-\(insets.top)-[subView]-\(insets.bottom)-|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["subView" : self])
        
        superview?.addConstraints(cons)
        
        return cons
    }
    
    ///  参照参考视图内部对齐
    ///
    ///  - parameter type:      对齐方式
    ///  - Parameter referView: 参考视图
    ///  - Parameter size:      视图大小，如果是 nil 则不设置大小
    ///  - Parameter offset:    偏移量，默认是 CGPoint(x: 0, y: 0)
    ///
    ///  - returns: 约束数组
    public func ff_AlignInner(type type: ff_AlignType, referView: UIView, size: CGSize?, offset: CGPoint = CGPointZero) -> [NSLayoutConstraint]  {
        
        return ff_AlignLayout(referView, attributes: type.layoutAttributes(true, isVertical: true), size: size, offset: offset)
    }
    
    ///  参照参考视图垂直对齐
    ///
    ///  - parameter type:      对齐方式
    ///  - parameter referView: 参考视图
    ///  - parameter size:      视图大小，如果是 nil 则不设置大小
    ///  - parameter offset:    偏移量，默认是 CGPoint(x: 0, y: 0)
    ///
    ///  - returns: 约束数组
    public func ff_AlignVertical(type type: ff_AlignType, referView: UIView, size: CGSize?, offset: CGPoint = CGPointZero) -> [NSLayoutConstraint] {
        
        return ff_AlignLayout(referView, attributes: type.layoutAttributes(false, isVertical: true), size: size, offset: offset)
    }
    
    ///  参照参考视图水平对齐
    ///
    ///  - parameter type:      对齐方式
    ///  - parameter referView: 参考视图
    ///  - parameter size:      视图大小，如果是 nil 则不设置大小
    ///  - parameter offset:    偏移量，默认是 CGPoint(x: 0, y: 0)
    ///
    ///  - returns: 约束数组
    public func ff_AlignHorizontal(type type: ff_AlignType, referView: UIView, size: CGSize?, offset: CGPoint = CGPointZero) -> [NSLayoutConstraint] {
        
        return ff_AlignLayout(referView, attributes: type.layoutAttributes(false, isVertical: false), size: size, offset: offset)
    }
    
    ///  在当前视图内部水平平铺控件
    ///
    ///  - parameter views:  子视图数组
    ///  - parameter insets: 间距
    ///
    ///  - returns: 约束数组
    public func ff_HorizontalTile(views: [UIView], insets: UIEdgeInsets) -> [NSLayoutConstraint] {
        
        assert(!views.isEmpty, "views should not be empty")
        
        var cons = [NSLayoutConstraint]()
        
        let firstView = views[0]
        firstView.ff_AlignInner(type: ff_AlignType.TopLeft, referView: self, size: nil, offset: CGPoint(x: insets.left, y: insets.top))
        cons.append(NSLayoutConstraint(item: firstView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -insets.bottom))
        
        // 添加后续视图的约束
        var preView = firstView
        for i in 1..<views.count {
            let subView = views[i]
            cons += subView.ff_sizeConstraints(firstView)
            subView.ff_AlignHorizontal(type: ff_AlignType.TopRight, referView: preView, size: nil, offset: CGPoint(x: insets.right, y: 0))
            preView = subView
        }

        let lastView = views.last!
        cons.append(NSLayoutConstraint(item: lastView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -insets.right))
        
        addConstraints(cons)
        return cons
    }
    
    ///  在当前视图内部垂直平铺控件
    ///
    ///  - parameter views:  子视图数组
    ///  - parameter insets: 间距
    ///
    ///  - returns: 约束数组
    public func ff_VerticalTile(views: [UIView], insets: UIEdgeInsets) -> [NSLayoutConstraint] {
        
        assert(!views.isEmpty, "views should not be empty")
        
        var cons = [NSLayoutConstraint]()
        
        let firstView = views[0]
        firstView.ff_AlignInner(type: ff_AlignType.TopLeft, referView: self, size: nil, offset: CGPoint(x: insets.left, y: insets.top))
        cons.append(NSLayoutConstraint(item: firstView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -insets.right))
        
        // 添加后续视图的约束
        var preView = firstView
        for i in 1..<views.count {
            let subView = views[i]
            cons += subView.ff_sizeConstraints(firstView)
            subView.ff_AlignVertical(type: ff_AlignType.BottomLeft, referView: preView, size: nil, offset: CGPoint(x: 0, y: insets.bottom))
            preView = subView
        }
        
        let lastView = views.last!
        cons.append(NSLayoutConstraint(item: lastView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -insets.bottom))
        
        addConstraints(cons)
        
        return cons
    }
    
    ///  从约束数组中查找指定 attribute 的约束
    ///
    ///  - parameter constraintsList: 约束数组
    ///  - parameter attribute:       约束属性
    ///
    ///  - returns: attribute 对应的约束
    public func ff_Constraint(constraintsList: [NSLayoutConstraint], attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        for constraint in constraintsList {
            if constraint.firstItem as! NSObject == self && constraint.firstAttribute == attribute {
                return constraint
            }
        }
        
        return nil
    }
    
    /**
    与四周控件的参照关系
    
    :param: edgesView UIedgeView 类链表结构设置参数
    
    :returns: 约束数组
    */
    public func ff_edgesView(edgesView: UIedgeView!) -> [NSLayoutConstraint]? {

        translatesAutoresizingMaskIntoConstraints = false
        let dict = edgesView.dict
        var cons = [NSLayoutConstraint]()
        
        // 遍历添加约束
        for key in dict.allKeys {
          let layout = dict.objectForKey(key) as! JYlayout
         cons.append(ff_viewConstraint(layout.Attribute1!, equal: layout.Equal, referView: layout.View!, attribute2: layout.Attribute2!, multiplier: layout.Multiplier!, offset: layout.offset))
        }
      
        // 看是否是指定数值的Size
        if edgesView.esize != CGSize(width: -1 , height: -1){
          cons += ff_sizeConstraints(edgesView.esize)
        }
        
       superview!.addConstraints(cons)
        return cons ;
    }
    
    
    
    
    // MARK: - 私有函数
    ///  参照参考视图对齐布局
    ///
    ///  - parameter referView:  参考视图
    ///  - parameter attributes: 参照属性
    ///  - parameter size:       视图大小，如果是 nil 则不设置大小
    ///  - parameter offset:     偏移量，默认是 CGPoint(x: 0, y: 0)
    ///
    ///  - returns: 约束数组
    private func ff_AlignLayout(referView: UIView, attributes: ff_LayoutAttributes, size: CGSize?, offset: CGPoint) -> [NSLayoutConstraint] {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var cons = [NSLayoutConstraint]()
        
        cons += ff_positionConstraints(referView, attributes: attributes, offset: offset)
        
        if size != nil {
            cons += ff_sizeConstraints(size!)
        }
        
        superview?.addConstraints(cons)
        
        return cons
    }
    
    ///  尺寸约束数组
    ///
    ///  - parameter size: 视图大小
    ///
    ///  - returns: 约束数组
    private func ff_sizeConstraints(size: CGSize) -> [NSLayoutConstraint] {
        
        var cons = [NSLayoutConstraint]()
        if size.width >= 0 {
            cons.append(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: size.width))
        }
        
        if size.height >= 0{
            cons.append(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: size.height))
        }
        return cons
    }
    
    ///  尺寸约束数组
    ///
    ///  - parameter referView: 参考视图，与参考视图大小一致
    ///
    ///  - returns: 约束数组
    private func ff_sizeConstraints(referView: UIView) -> [NSLayoutConstraint] {

        var cons = [NSLayoutConstraint]()

        cons.append(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: referView, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0))
        cons.append(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: referView, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0))

        return cons
    }
    
    ///  位置约束数组
    ///
    ///  - parameter referView:  参考视图
    ///  - parameter attributes: 参照属性
    ///  - parameter offset:     偏移量
    ///
    ///  - returns: 约束数组
    private func ff_positionConstraints(referView: UIView, attributes: ff_LayoutAttributes, offset: CGPoint) -> [NSLayoutConstraint] {
        
        var cons = [NSLayoutConstraint]()
        
        cons.append(NSLayoutConstraint(item: self, attribute: attributes.horizontal, relatedBy: NSLayoutRelation.Equal, toItem: referView, attribute: attributes.referHorizontal, multiplier: 1.0, constant: offset.x))
        cons.append(NSLayoutConstraint(item: self, attribute: attributes.vertical, relatedBy: NSLayoutRelation.Equal, toItem: referView, attribute: attributes.referVertical, multiplier: 1.0, constant: offset.y))
        
        return cons
    }
    
    /**
    根据参考视图是否是父控件来设置约束  如果是父控件 要调整 attribute
    
    :param: attribute  self 的 参照属性
    :param: referView  参照视图
    :param: offset     偏移
    
    :returns: 约束
    */
    private func ff_viewConstraint(attribute1: NSLayoutAttribute , equal : NSLayoutRelation , referView: UIView, attribute2:NSLayoutAttribute , multiplier : CGFloat , offset: CGFloat) -> NSLayoutConstraint {
        let attribute = self.superview != referView ? attribute2 : ff_fzattribute(attribute2)
        return ff_positionConstraint(attribute1, equal: equal, referView: referView, attribute2: attribute, multiplier: multiplier, offset: offset)
    }
    
    /**
    调转 NSLayoutAttribute  上变下 左边右
    */
    private func ff_fzattribute(attribute: NSLayoutAttribute) -> NSLayoutAttribute {
        switch attribute {
        case NSLayoutAttribute.Top  : return  NSLayoutAttribute.Bottom
        case NSLayoutAttribute.Left  : return  NSLayoutAttribute.Right
        case NSLayoutAttribute.Right  : return  NSLayoutAttribute.Left
        case NSLayoutAttribute.Bottom  : return  NSLayoutAttribute.Top
        default : return  attribute
        }
    }
    
    /**
    单一位置约束
    :param: attribute1  self 的 参照属性
    :param: referView   参照视图
    :param: attribute2  参照属性
    :param: offset      偏移
    :returns: 约束
    */
    private func ff_positionConstraint(attribute1: NSLayoutAttribute , equal : NSLayoutRelation , referView: UIView, attribute2:NSLayoutAttribute , multiplier : CGFloat , offset: CGFloat ) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self , attribute: attribute1, relatedBy: equal, toItem: referView, attribute: attribute2 , multiplier:multiplier , constant: offset)
    }

    
}

///  布局属性
private final class ff_LayoutAttributes {
    var horizontal:         NSLayoutAttribute
    var referHorizontal:    NSLayoutAttribute
    var vertical:           NSLayoutAttribute
    var referVertical:      NSLayoutAttribute
    
    init() {
        horizontal = NSLayoutAttribute.Left
        referHorizontal = NSLayoutAttribute.Left
        vertical = NSLayoutAttribute.Top
        referVertical = NSLayoutAttribute.Top
    }
    
    init(horizontal: NSLayoutAttribute, referHorizontal: NSLayoutAttribute, vertical: NSLayoutAttribute, referVertical: NSLayoutAttribute) {
        
        self.horizontal = horizontal
        self.referHorizontal = referHorizontal
        self.vertical = vertical
        self.referVertical = referVertical
    }
    
    private func horizontals(from: NSLayoutAttribute, to: NSLayoutAttribute) -> Self {
        horizontal = from
        referHorizontal = to
        
        return self
    }
    
    private func verticals(from: NSLayoutAttribute, to: NSLayoutAttribute) -> Self {
        vertical = from
        referVertical = to
        
        return self
    }
    
}



// MARK:- ff_edgesView 参数设置相关类和方法

let ffTop = "top"
let ffLeft = "ffLeft"
let ffRight = "ffRight"
let ffBootom = "ffBootom"
let ffCenterX = "ffCenterX"
let ffCenterY = "ffCenterY"
let ffHeight = "ffHeight"
let ffWidth = "ffWidth"

/// swift 貌似关于位移枚举 没啥解决方案 在网上找的 用结构体实现位移枚举
public struct ff_tlbr  {
    var value: UInt = 0
    init(_ value: UInt) { self.value = value }
    func toRaw() -> UInt { return self.value }
    func getLogicValue() -> Bool { return self.value != 0 }
    
    static func fromRaw(raw: UInt) -> ff_tlbr? { return ff_tlbr(raw) }
    static func fromMask(raw: UInt) -> ff_tlbr { return ff_tlbr(raw) }
    
  public  static var top : ff_tlbr   { return ff_tlbr(1 << 0) }
  public  static var left : ff_tlbr  { return ff_tlbr(1 << 1) }
  public  static var bottom : ff_tlbr   { return ff_tlbr(1 << 2) }
  public  static var right : ff_tlbr   { return ff_tlbr(1 << 3) }
  public  static var all : ff_tlbr   { return ff_tlbr(UInt.max) }
  public  static var untop : ff_tlbr   { return ff_tlbr.left | ff_tlbr.bottom | ff_tlbr.right }
  public  static var unleft : ff_tlbr   { return ff_tlbr.top | ff_tlbr.bottom | ff_tlbr.right }
  public  static var unbottom : ff_tlbr   { return ff_tlbr.left | ff_tlbr.top | ff_tlbr.right }
  public  static var unright : ff_tlbr   { return ff_tlbr.left | ff_tlbr.bottom | ff_tlbr.top }
  
}

public func == (lhs: ff_tlbr, rhs: ff_tlbr) -> Bool     { return lhs.value == rhs.value }
public func | (lhs: ff_tlbr, rhs: ff_tlbr) -> ff_tlbr { return ff_tlbr(lhs.value | rhs.value) }
public func & (lhs: ff_tlbr, rhs: ff_tlbr) -> ff_tlbr { return ff_tlbr(lhs.value & rhs.value) }
public func ^ (lhs: ff_tlbr, rhs: ff_tlbr) -> ff_tlbr { return ff_tlbr(lhs.value ^ rhs.value) }


// 约束参数类 记录一个约束的所有参数
private class JYlayout : NSObject {
    var View    : UIView?
    var Attribute1 : NSLayoutAttribute?
    var Attribute2 : NSLayoutAttribute?
    var Multiplier : CGFloat?
    var Equal = NSLayoutRelation.Equal
    var offset : CGFloat
    
    init(v:UIView! , c : CGFloat, a1 : NSLayoutAttribute  , a2 : NSLayoutAttribute, m : CGFloat, e : NSLayoutRelation) {
        View = v
        Multiplier = m
        Attribute1 = a1
        Attribute2 = a2
        Equal = e
        offset = c
    }
}


// 设置需要的约束参数
public class UIedgeView : NSObject {
    var dict : NSMutableDictionary = NSMutableDictionary()
    var esize = CGSize(width: -1.0 , height: -1.0)
    
    public func more(tlbr tlbr : ff_tlbr , v:UIView!) -> UIedgeView {
        if tlbr & ff_tlbr.top == ff_tlbr.top { top(v , c : 0) }
        if tlbr & ff_tlbr.left == ff_tlbr.left { left(v , c : 0)}
        if tlbr & ff_tlbr.bottom == ff_tlbr.bottom { bottom(v , c : 0) }
        if tlbr & ff_tlbr.right == ff_tlbr.right { right(v , c : 0) }
        return self
    }
    
    /**
    参数描述 基本可不填
    
    :param: v 参考view
    :param: c 偏移 量
    :param: a 默认底边 如果参考View 是父控件就是 上边
    :param: m 比例系数，默认为 1.0
    :param: e 大于等于小于 默认 等于
    
    :returns: self 
    */
    public func top(v:UIView! , c : CGFloat , a : NSLayoutAttribute = NSLayoutAttribute.Bottom , m : CGFloat = 1.0 , e : NSLayoutRelation = NSLayoutRelation.Equal) -> UIedgeView {
        let layout = JYlayout(v: v, c: c, a1:NSLayoutAttribute.Top , a2: a, m: m, e: e)
        dict .setValue(layout, forKey: ffTop)
        return self
    }
    
    public func left(v:UIView! , c : CGFloat  , a : NSLayoutAttribute = NSLayoutAttribute.Right , m : CGFloat = 1.0 , e : NSLayoutRelation = NSLayoutRelation.Equal ) -> UIedgeView {
        let layout = JYlayout(v: v, c: c, a1:NSLayoutAttribute.Left , a2: a, m: m, e: e)
        dict .setValue(layout, forKey: ffLeft)
        return self
    }
    
    public func bottom(v:UIView! , c : CGFloat  , a : NSLayoutAttribute = NSLayoutAttribute.Top , m : CGFloat = 1.0 , e : NSLayoutRelation = NSLayoutRelation.Equal ) -> UIedgeView {
        let offset = a == NSLayoutAttribute.Top ? -c : c
        let layout = JYlayout(v: v, c: offset, a1:NSLayoutAttribute.Bottom , a2: a, m: m, e: e)
        dict .setValue(layout, forKey: ffBootom)
        return self
    }
    
    public func right(v:UIView! , c : CGFloat  , a : NSLayoutAttribute = NSLayoutAttribute.Left , m : CGFloat = 1.0 , e : NSLayoutRelation = NSLayoutRelation.Equal) -> UIedgeView {
        let offset = a == NSLayoutAttribute.Left ? -c : c
        let layout = JYlayout(v: v, c: offset, a1:NSLayoutAttribute.Right , a2: a, m: m, e: e)
        dict .setValue(layout, forKey: ffRight)
        return self
    }
    
    public func centerX(v:UIView! , c : CGFloat  , a : NSLayoutAttribute = NSLayoutAttribute.CenterX , m : CGFloat = 1.0 , e : NSLayoutRelation = NSLayoutRelation.Equal) -> UIedgeView {
        let layout = JYlayout(v: v, c: c, a1:NSLayoutAttribute.CenterX , a2: a, m: m, e: e)
        dict .setValue(layout, forKey: ffCenterX)
        return self
    }
    
    public func centerY(v:UIView! , c : CGFloat  , a : NSLayoutAttribute = NSLayoutAttribute.CenterY , m : CGFloat = 1.0 , e : NSLayoutRelation = NSLayoutRelation.Equal) -> UIedgeView {
        let layout = JYlayout(v: v, c: c, a1:NSLayoutAttribute.CenterY , a2: a, m: m, e: e)
        dict .setValue(layout, forKey: ffCenterY)
        return self
    }
    
    public func center(v:UIView! , p : CGPoint = CGPointZero ) -> UIedgeView {
        centerX(v, c: p.x)
        centerY(v, c: p.y)
        return self
    }
    
    public func height(v:UIView! , c : CGFloat = 0 , a : NSLayoutAttribute = NSLayoutAttribute.Height , m : CGFloat = 1.0 , e : NSLayoutRelation = NSLayoutRelation.Equal) -> UIedgeView {
        let layout = JYlayout(v: v, c: c, a1:NSLayoutAttribute.Height , a2: a, m: m, e: e)
        dict .setValue(layout, forKey: ffHeight)
        return self
    }
    
    public func width(v:UIView! , c : CGFloat = 0 , a : NSLayoutAttribute = NSLayoutAttribute.Width , m : CGFloat = 1.0 , e : NSLayoutRelation = NSLayoutRelation.Equal) -> UIedgeView {
        let layout = JYlayout(v: v, c: c, a1:NSLayoutAttribute.Width , a2: a, m: m, e: e)
        dict .setValue(layout, forKey: ffWidth)
        return self
    }
    
    public func size (v:UIView! , set : CGPoint = CGPointZero) -> UIedgeView {
        height(v, c: set.x)
        width(v, c: set.y)
        return self
    }
    
    public func height(h : CGFloat!) -> UIedgeView {
        esize.height = h
        return self
    }
    
    public func width(w : CGFloat!) -> UIedgeView {
        esize.width = w
        return self
    }
    
    public func size (size : CGSize!) -> UIedgeView {
        esize = size
        return self
    }
    
    public func size (w : CGFloat! , h : CGFloat!) -> UIedgeView {
        esize = CGSize(width: w, height: h)
        return self
    }
    
    /// 如果没有设置参照view 设置此参数无用
    public func topSet(c : CGFloat) -> UIedgeView{
       return ff_offset(ffTop, c: c)
    }
    
    /// 如果没有设置参照view 设置此参数无用
    public func leftSet(c : CGFloat) -> UIedgeView{
       return ff_offset(ffLeft, c: c)

    }
    
    /// 如果没有设置参照view 设置此参数无用
    public func bottomSet(c : CGFloat) -> UIedgeView {
       return ff_offset(ffBootom, c: c)
    }
    
    /// 如果没有设置参照view 设置此参数无用
    public func rightSet(c : CGFloat) -> UIedgeView {
       return ff_offset(ffRight, c: c)
    }
    
    private func ff_offset (s: String , c: CGFloat) -> UIedgeView {
        let laout = dict[s] as? JYlayout
        if laout == nil {
            return self
        }
        laout!.offset = c
        return self
    }
    
    /// 如果没有设置参照view 设置此参数无用
    public func edgeSet(t: CGFloat , l : CGFloat , b : CGFloat , r : CGFloat) -> UIedgeView{
       return topSet(t).leftSet(l).bottomSet(b).rightSet(r)
    }
    
    /// 如果没有设置参照view 设置此参数无用
    public func edgeSet(edge : UIEdgeInsets) -> UIedgeView {
       return edgeSet(edge.top, l: edge.left, b: edge.bottom, r: edge.right)
    }
    
    
    
    
}
