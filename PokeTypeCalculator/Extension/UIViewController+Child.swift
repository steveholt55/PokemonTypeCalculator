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
        (parentView ?? view).addSubview(child.view)
        guard let superview = child.view.superview else {
            fatalError()
        }
        child.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.view.topAnchor.constraint(equalTo: superview.topAnchor),
            child.view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            child.view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ])
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
