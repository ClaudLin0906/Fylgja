//
//  CustomTextField.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/22.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp() {
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.05349428952, green: 0.4775813818, blue: 0.7034791708, alpha: 1)
    }
    
}
