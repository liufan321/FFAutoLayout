# FFAutoLayout
Simple Autolayout extension in Swift 2.0

    public func ff_edgesView(edgesView: UIedgeView!) -> [NSLayoutConstraint]? ｛  
    //   使用见Demo 
    }

使用注意: 

    public func top(v:UIView! , c : CGFloat , a : NSLayoutAttribute = NSLayoutAttribute.Bottom , m : CGFloat = 1.0 , e : NSLayoutRelation = NSLayoutRelation.Equal) -> UIedgeView { }

   top  left bottom  right  centerX  centerY  center  height  width  size 

如下:
    leftTop.ff_edgesView(UIedgeView().width(centerBtn, m: 0.5).height(centerBtn, m: 0.5).top(self, c: 64).left(self, c: 0))

    一般情况只需传入  v:UIView! , c : CGFloat , 
    如果 v 是self 的父视图 上对上  下对下  左对左  右对右 的间距
    如果 v 与 self 非父子关系 则 上对下  左对右 下对上 右对左的间距
    如有其它需求请传入对应参数.

    举例 : superView1  是 view1  的父视图
    在使用时必须将 view1 添加到 superView1 上面否则会报错
    view1.ff_edgesView(UIedgeView().top(superView1, c: 64).left(superView1, c: 0))  正确
    但是 
    superView1.ff_edgesView(UIedgeView().top(view1, c: 64).left(view1, c: 0)) 是不一样的,是不被允许的.
