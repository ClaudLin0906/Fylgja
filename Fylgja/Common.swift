//
//  Common.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/11/19.
//

import Foundation
import UIKit

var isLogin = false

protocol NibOwnerLoadable: AnyObject {
    static var nib: UINib { get }
}

func getTopController() -> UIViewController? {
    let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

    if var topController = keyWindow?.rootViewController {
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        return topController
    }
    return nil
}

