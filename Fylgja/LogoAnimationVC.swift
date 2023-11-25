//
//  LogoAnimationVC.swift
//  RecycledChicken
//
//  Created by 林書郁 on 2023/5/6.
//

import UIKit

class LogoAnimationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            self.showMainRootVC()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    private func showMainRootVC(){
        if let rootVC = storyboard?.instantiateViewController(withIdentifier: "MainRootVC") as? MainRootVC {
            rootVC.modalPresentationStyle = .fullScreen
            present(rootVC, animated: false)
        }
    }
}
