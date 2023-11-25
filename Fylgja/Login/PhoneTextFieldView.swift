//
//  PhoneTextFieldView.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/11/25.
//

import UIKit

class PhoneTextFieldView: UIView, NibOwnerLoadable {

    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit(){
        loadNibContent()
        if let color = UIColor(named: "CommonColor"){
            layer.borderColor = color.cgColor
        }
    }

}
