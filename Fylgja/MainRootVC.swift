//
//  MainRootVC.swift
//  RecycledChicken
//
//  Created by 林書郁 on 2023/5/6.
//

import UIKit

class MainRootVC: UIViewController {
    
    var isFirstOpen: Bool = true
    
    var backgroundView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if LocationManager.shared.isLocationServicesEnabled() {
            if !isLogin {
                showLogin()
            }else{
                
            }
            
        } else {
            showAskLocationPremission()
        }
    }
    
    private func showLogin(){
        if let VC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "Login") as? LoginVC {
            VC.modalPresentationStyle = .fullScreen
            self.present(VC, animated: true)
        }
    }
    
    private func showAskLocationPremission(){
        if let VC = UIStoryboard(name: "AskLocationPremission", bundle: nil).instantiateViewController(withIdentifier: "AskLocationPremission") as? AskLocationPremissionVC {
            VC.modalPresentationStyle = .fullScreen
            present(VC, animated: false)
        }
    }
}
