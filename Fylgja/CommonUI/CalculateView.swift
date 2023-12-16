//
//  CalculateView.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/16.
//

import UIKit

class CalculateView: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var minusBtn:UIButton!
    
    @IBOutlet weak var textField:UITextField!
    
    @IBOutlet weak var plusBtn:UIButton!

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
    }
}
