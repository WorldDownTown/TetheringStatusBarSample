//
//  ViewController.swift
//  StatusBarSample
//
//  Created by shoji on 2016/05/13.
//  Copyright © 2016年 com.shoji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tc = createTabBarController()
        addChildViewController(tc)
        view.addSubview(tc.view)
//        view.addFittingConstraintsFor(tc.view)
        tc.didMoveToParentViewController(self)
    }

    private func createTabBarController() -> UITabBarController {
        let vc1 = TableViewController(style: .Plain)
        vc1.title = "first"
        vc1.tabBarItem = UITabBarItem(title: "first", image: UIImage(named: "first"), tag: 0)
        let nc1 = UINavigationController(rootViewController: vc1)

        let vc2 = TableViewController(style: .Plain)
        vc2.title = "second"
        vc2.tabBarItem = UITabBarItem(title: "second", image: UIImage(named: "second"), tag: 0)
        let nc2 = UINavigationController(rootViewController: vc2)

        let tc = UITabBarController()
        tc.viewControllers = [nc1, nc2]
        return tc
    }
}


extension UIView {

    /**
     childViewが同じサイズに収まるように、constraintsを設定する

     - parameter childView: 子View
     */
    func addFittingConstraintsFor(childView: UIView) {
        let constraints = [.Top, .Leading, .Bottom, .Trailing].map {
            NSLayoutConstraint(
                item: childView,
                attribute: $0,
                relatedBy: .Equal,
                toItem: self,
                attribute: $0,
                multiplier: 1.0,
                constant: 0.0)
        }
        childView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(constraints)
    }
}
