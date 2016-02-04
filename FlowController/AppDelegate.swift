//
//  AppDelegate.swift
//  FlowController
//
//  Created by Olivier Collet on 2015-11-11.
//  Copyright © 2015 88bits Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: TabBarFlowController {

    var window: UIWindow?


    override func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        if let tabBarController = self.window?.rootViewController as? UITabBarController {
            self.tabBarController = tabBarController
        }
        return true
    }

}

