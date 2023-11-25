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

func toPhoneFormat(_ phoneNumber:String) -> String {
    guard validateCellPhone(phoneNumber) else { return "" }
    var result = removeWhitespace(phoneNumber)
    result = result.replacingOccurrences(of: "(\\d{4})(\\d{3})(\\d+)", with: "$1 $2 $3", options: .regularExpression, range: nil)
    return result
}

func validateCellPhone(_ text:String) -> Bool{
    let mobileReg = "^09\\d{8}$"
    let resgextestMobile = NSPredicate(format: "SELF MATCHES %@", mobileReg).evaluate(with: text)
    return resgextestMobile
}

func removeWhitespace(_ string: String) -> String {
    let components = string.components(separatedBy: .whitespaces)
    let filteredString = components.joined()
    return filteredString
}
