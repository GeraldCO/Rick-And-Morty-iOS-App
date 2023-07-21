//
//  ViewController+Helper.swift
//  Rick-and-Morty
//
//  Created by Gerald on 20/7/23.
//

import UIKit
import IHProgressHUD

extension UIViewController {

    func add(viewController: UIViewController, to containingView: UIView) {
        
        if viewController.parent != nil {
            viewController.willMove(toParent: nil)
            viewController.removeFromParent()
        }
        containingView.addSubview(viewController.view)

        addChild(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                   options: .directionLeadingToTrailing,
                                                                   metrics: nil,
                                                                   views: ["view": viewController.view as Any]))

        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                   options: .directionLeadingToTrailing,
                                                                   metrics: nil,
                                                                   views: ["view": viewController.view as Any]))
        viewController.didMove(toParent: self)
    }
}

extension UIViewController {

    func showLoadingIndicator() {
        
        IHProgressHUD.show()
    }

    func dismissLoadingIndicator() {
        
        IHProgressHUD.dismiss()
    }
}
