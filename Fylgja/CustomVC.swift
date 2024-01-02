//
//  CustomVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/3.
//

import UIKit

class CustomVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        let closeTap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard(_:)))
        closeTap.cancelsTouchesInView = false
        view.addGestureRecognizer(closeTap)
    }
    
    @objc private func backBtnPressed(){
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }else{
            print("navigationController is nil")
        }
    }
    
    func setDefaultNavigationBackBtn(){
        let backBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backBtnPressed))
        backBtn.tintColor = commonColor
        navigationItem.leftBarButtonItem = backBtn
        
        let barAppearance =  UINavigationBarAppearance()
        barAppearance.configureWithTransparentBackground()
        barAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: commonColor]
        navigationController?.navigationBar.standardAppearance = barAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    @objc private func closeKeyboard(_ tap:UITapGestureRecognizer){
        view.endEditing(true)
    }

}

extension CustomVC: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
