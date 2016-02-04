//
//  TabBarFlowController.swift
//  FlowController
//
//  Created by Olivier Collet on 2015-11-11.
//  Copyright © 2015 88bits Inc. All rights reserved.
//

import UIKit

class TabBarFlowController: FlowController, UITabBarControllerDelegate {

    var tabBarController: UITabBarController! {
        didSet {
            tabBarController?.delegate = self
        }
    }

    override init() {
        super.init()
        self.tabBarController = UITabBarController()
    }


    // MARK: - Tab bar controller delegate -

    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        self.currentViewController = viewController
    }

    func tabBarControllerSupportedInterfaceOrientations(tabBarController: UITabBarController) -> UIInterfaceOrientationMask {
        if let selectedViewController = tabBarController.selectedViewController {
            return selectedViewController.supportedInterfaceOrientations()
        }
        return tabBarController.supportedInterfaceOrientations()
    }

    func tabBarControllerPreferredInterfaceOrientationForPresentation(tabBarController: UITabBarController) -> UIInterfaceOrientation {
        if let selectedViewController = tabBarController.selectedViewController {
            return selectedViewController.preferredInterfaceOrientationForPresentation()
        }
        return tabBarController.preferredInterfaceOrientationForPresentation()
    }


    func tabBarController(tabBarController: UITabBarController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }

    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}
