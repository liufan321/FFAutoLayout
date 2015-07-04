//
//  DemoViewController.swift
//  FFAutoLayout
//
//  Created by 刘凡 on 15/6/27.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    var exampleInfo: ExampleInfo?
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        
        let demoView = exampleInfo!.cls.new() as! UIView
        view.addSubview(demoView)
        demoView.ff_Fill(view)
    }    
}
