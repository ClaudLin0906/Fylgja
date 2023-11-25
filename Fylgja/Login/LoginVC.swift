//
//  LoginVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/11/25.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tapLogin(_ sender:UIButton) {
        isLogin = true
        if let VC = UIStoryboard(name: "VerificationCode", bundle: nil).instantiateViewController(withIdentifier: "VerificationCode") as? VerificationCodeVC {
            VC.modalPresentationStyle = .fullScreen
            self.present(VC, animated: true)
        }
    }

    @IBAction func guestLogin(_ sender:UIButton) {
        
    }
    
}
