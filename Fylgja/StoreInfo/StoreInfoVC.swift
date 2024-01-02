//
//  StoreInfoVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/17.
//

import UIKit

class StoreInfoVC: CustomVC {
    
    @IBOutlet weak var step2View:UIView!
    
    @IBOutlet weak var phoneNumberConnectView:ConnectInfoView!
    
    @IBOutlet weak var locationViewConnectView:ConnectInfoView!
    
    @IBOutlet weak var addMemberConnectView:ConnectInfoView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "商家資訊"
        UIInit()
        // Do any additional setup after loading the view.
    }
    
    private func UIInit() {
        step2View.layer.maskedCorners = .top
        let tintColor = #colorLiteral(red: 0.6039215686, green: 0.6039215686, blue: 0.6039215686, alpha: 1)
        phoneNumberConnectView.imageView.image = UIImage(systemName: "phone.badge.waveform")?.withTintColor(tintColor)
        phoneNumberConnectView.label.text = "0932266860"
        locationViewConnectView.imageView.image = UIImage(named: "location-border")?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
        locationViewConnectView.label.text = "查詢位置"
        addMemberConnectView.imageView.image = UIImage(systemName: "person")?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
        addMemberConnectView.label.text = "加入店家會員"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDefaultNavigationBackBtn()
    }

}
