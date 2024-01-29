//
//  AddSuccess.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/29.
//

import UIKit

class AddSuccess: UIView, NibOwnerLoadable {

    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        loadNibContent()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapHandle(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @IBAction func closeBtnAction(_ sender:UIButton) {
       remove()
    }
    
    @objc private func tapHandle(_ tap:UIGestureRecognizer) {
        remove()
    }
    
    private func remove() {
        removeFromSuperview()
    }
    
    

}
