//
//  Extension.swift
//  MapsNav
//
//  Created by 麦志超 on 2017/11/21.
//  Copyright © 2017年 MZC. All rights reserved.
//

import UIKit


public extension UIViewController
{
    /// 获取当前显示的 ViewController
    public class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?
    {
        if let nav = base as? UINavigationController
        {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController
        {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController
        {
            return currentViewController(base: presented)
        }
        return base
    }
}
