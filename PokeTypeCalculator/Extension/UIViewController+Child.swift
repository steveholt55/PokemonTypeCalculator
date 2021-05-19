//
//  UIViewController+Child.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 5/5/21.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController, parentView: UIView? = nil) {
        addChild(child)
        child.view.frame = (parentView ?? view).frame
        (parentView ?? view).addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
