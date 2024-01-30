//
//  ProfileDetailModel.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/30.
//

import Foundation

enum ProfileDetailCategory:String {
    case name = "姓名"
    case gender = "性別"
    case birthdayDate = "出生年月日"
    case email = "電子信箱"
    case phone = "手機號碼"
}

struct ProfileDetailTableViewInfo{
    var category:ProfileDetailCategory
    var categoryInfo:String
}
