//
//  TagView.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/9.
//

import UIKit

class TagView: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var label:UILabel!
        
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
    
    func setTag(_ tagTitle:String, _ status:TagStatus) {
        backgroundColor = status.backgroundColor
        label.text = tagTitle
    }

}
