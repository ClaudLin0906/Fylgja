//
//  ProfileModel.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/29.
//

import Foundation
import UIKit

struct ProfileInfo {
    var image:UIImage
    var title:String
    var type:ProfileCellType = .def
}

enum ProfileCellType {
    case def
    case swi
    case ver
}
