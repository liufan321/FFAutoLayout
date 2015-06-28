//
//  AppDelegate.swift
//  FFAutoLayout iOS Examples
//
//  Created by 刘凡 on 15/6/28.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        window?.rootViewController = UINavigationController(rootViewController: DemoListViewController())
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

