//
//  NavigationFlowController.swift
//  FlowController
//
//  Created by Olivier Collet on 2015-11-11.
//  Copyright © 2015 88bits Inc. All rights reserved.
//

import UIKit


class NavigationFlowController: FlowController, UINavigationControllerDelegate {

    var navigationController: UINavigationController! {
        didSet {
            navigationController?.delegate = self
        }
    }

    override init() {
        super.init()
        self.navigationController = UINavigationController()
    }

    
    // MARK: - Navigation controller delegate

    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
    }

    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        self.currentViewController = viewController
    }

    func navigationControllerSupportedInterfaceOrientations(navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        if let topViewController = navigationController.topViewController {
            return topViewController.supportedInterfaceOrientations()
        }
        return navigationController.supportedInterfaceOrientations()
    }

    func navigationControllerPreferredInterfaceOrientationForPresentation(navigationController: UINavigationController) -> UIInterfaceOrientation {
        if let topViewController = navigationController.topViewController {
            return topViewController.preferredInterfaceOrientationForPresentation()
        }
        return navigationController.preferredInterfaceOrientationForPresentation()
    }

    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }

    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}
