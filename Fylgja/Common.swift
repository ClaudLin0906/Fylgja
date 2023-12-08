//
//  Common.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/11/19.
//

import Foundation
import UIKit

var isLogin = false

let keyWindow = UIApplication.shared.windows.filter({ $0.isKeyWindow }).last

protocol NibOwnerLoadable: AnyObject {
    static var nib: UINib { get }
}

enum WaitStatus {
    case open
    case close
    
    var color:UIColor {
        switch self {
        case .open:
            return #colorLiteral(red: 0.6352941176, green: 0.937254902, blue: 0.3019607843, alpha: 1)
        case .close:
            return #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1)
        }
    }
    
    var description: String {
        switch self {
        case .open:
            return "開放候位中"
        case .close:
            return "暫停候位中"
        }
    }
}

func getSuperController() -> UIViewController? {
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


