//
//  Common.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/11/19.
//

import Foundation
import UIKit

var isLogin = false

let keyWindow = UIApplication.shared.connectedScenes.map(({$0 as? UIWindowScene})).compactMap(({$0})).first?.windows.first


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

enum TagStatus {
    case noSelected
    case seclected
    
    var backgroundColor:UIColor {
        switch self {
        case .noSelected:
            return #colorLiteral(red: 0.7333333333, green: 0.7333333333, blue: 0.7333333333, alpha: 1)
        case .seclected:
            return commonColor
        }
    }
}

let commonColor = #colorLiteral(red: 0.07058823529, green: 0.3960784314, blue: 0.6431372549, alpha: 1)

func getSuperController() -> UIViewController? {
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

func pushVC(targetVC:UIViewController, navigation:UINavigationController) {
    DispatchQueue.main.async {
        if !(navigation.topViewController?.isKind(of: targetVC.classForCoder))!{
            navigation.pushViewController(targetVC, animated: true)
        }
    }
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


