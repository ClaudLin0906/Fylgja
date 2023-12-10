//
//  SearchView.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/8.
//

import UIKit

class SearchView: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var backgroundView:UIView!
    {
        didSet{
            backgroundView.layer.borderWidth = 1
            backgroundView.layer.borderColor = #colorLiteral(red: 0.7333333333, green: 0.7333333333, blue: 0.7333333333, alpha: 1)
        }
    }
    
    @IBOutlet weak var filterBtn:UIButton!
        
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
