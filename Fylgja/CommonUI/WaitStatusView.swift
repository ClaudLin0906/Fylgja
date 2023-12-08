//
//  WaitStatusView.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/8.
//

import UIKit

class WaitStatusView: UIView, NibOwnerLoadable {
    
    private var status:WaitStatus = .open
    
    @IBOutlet weak var statusColor:UIView!
    
    @IBOutlet weak var statusLabel:UILabel!
        
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
    
    func setStatus(_ status:WaitStatus) {
        statusColor.backgroundColor = status.color
        statusLabel.text = status.description
    }
    
}
