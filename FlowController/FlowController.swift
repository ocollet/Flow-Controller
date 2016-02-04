//
//  FlowController.swift
//  FrontDoor
//
//  Created by Olivier Collet on 2015-07-13.
//  Copyright © 2015 88bits Inc. All rights reserved.
//

import UIKit


// MARK: - Flow controller delegate -

protocol FlowControllerDelegate {
    func flowControllerDidFinish(flowController: FlowController)
}


// MARK: - Flow controller -

class FlowController: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var childFlowController: FlowController?
    var delegate: FlowControllerDelegate?
    var parentViewController: UIViewController?
    var currentViewController: UIViewController?
    
    
    // MARK: - Init

    convenience init(delegate: FlowControllerDelegate?) {
        self.init()
        self.delegate = delegate
    }
    
    func start(parentViewController: UIViewController!) {
        self.parentViewController = parentViewController
    }

    
    // MARK: - Flow

    internal func didFinish() {
        self.delegate?.flowControllerDidFinish(self)
    }

    
    // MARK: - Application delegate

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        if let childFlowController = self.childFlowController {
            return childFlowController.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        if let childFlowController = self.childFlowController {
            childFlowController.applicationWillResignActive(application)
        }
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        if let childFlowController = self.childFlowController {
            childFlowController.applicationDidEnterBackground(application)
        }
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        if let childFlowController = self.childFlowController {
            childFlowController.applicationWillEnterForeground(application)
        }
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if let childFlowController = self.childFlowController {
            childFlowController.applicationDidBecomeActive(application)
        }
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        if let childFlowController = self.childFlowController {
            childFlowController.applicationWillTerminate(application)
        }
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        if let childFlowController = self.childFlowController {
            return childFlowController.application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        }
        return false
    }
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        if let childFlowController = self.childFlowController {
            return childFlowController.application(application, handleOpenURL: url)
        }
        return false
    }

    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        if let childFlowController = self.childFlowController {
            childFlowController.application(application, didRegisterUserNotificationSettings: notificationSettings)
        }
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        if let childFlowController = self.childFlowController {
            childFlowController.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        }
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        if let childFlowController = self.childFlowController {
            childFlowController.application(application, didReceiveRemoteNotification: userInfo)
        }
    }

/*	Remove the comments if the app supports background fetch

    func application(application: UIApplication, performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        if let childFlowController = self.childFlowController {
            childFlowController.application(application, performFetchWithCompletionHandler: completionHandler)
        }
    }
*/
}
