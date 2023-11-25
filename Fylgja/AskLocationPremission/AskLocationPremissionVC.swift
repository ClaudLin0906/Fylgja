//
//  AskLocationPremissionVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/11/19.
//

import UIKit

class AskLocationPremissionVC: UIViewController {
    
    private var locationManager = LocationManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        UIInit()
        // Do any additional setup after loading the view.
    }
    
    private func UIInit(){
        
    }
    
    @IBAction func tapAction(_ sender:UIButton){
        locationManager.requestAuthorization()
    }

}
