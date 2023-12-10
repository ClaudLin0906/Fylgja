//
//  VerificationCodeVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/11/25.
//

import UIKit

class VerificationCodeVC: UIViewController {
    
    @IBOutlet weak var firstTextFieldView: VerificationCodeTextFieldView!
    
    @IBOutlet weak var secondTextFieldView: VerificationCodeTextFieldView!
    
    @IBOutlet weak var thirdTextFieldView: VerificationCodeTextFieldView!
    
    @IBOutlet weak var fourthTextFieldView: VerificationCodeTextFieldView!
    
    @IBOutlet weak var alertLabel:UILabel!
    
    var phoneNumber = "0932266860"

    override func viewDidLoad() {
        super.viewDidLoad()
        UIInit()
        // Do any additional setup after loading the view.
    }
    
    private func UIInit() {
        alertLabel.text = "已發送驗證碼至 \(toPhoneFormat(phoneNumber))請留意簡訊並輸入4位驗證碼"
        firstTextFieldView.textField.delegate = self
        firstTextFieldView.textField.tag = 1
        secondTextFieldView.textField.delegate = self
        secondTextFieldView.textField.tag = 2
        thirdTextFieldView.textField.delegate = self
        thirdTextFieldView.textField.tag = 3
        fourthTextFieldView.textField.delegate = self
        fourthTextFieldView.textField.tag = 4
    }

}

extension VerificationCodeVC: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 當輸入的字不為空字串時
        if (string != "") {
            //當textField不為空字串時
            if (textField.text == "") {
                textField.text = string
                //建立一個響應者為目前textField tag的下一個
                let nextResponder: UIResponder? = view.viewWithTag(textField.tag + 1)
                //只要響應者不是nil就讓他成為第一位響應者這樣就可以連續輸入時自動切到下一格
                if (nextResponder != nil) {
                    nextResponder?.becomeFirstResponder()
                }else{
                //當tag到最後時響應者會是nil此時執行將鍵盤收起的function
                    self.view.endEditing(true)
                    _ = (firstTextFieldView.textField.text ?? "") + (secondTextFieldView.textField.text ?? "") + (thirdTextFieldView.textField.text ?? "") + (fourthTextFieldView.textField.text ?? "")
                    
                    if let mainRootVC = self.view.findParentViewController(ofType: MainRootVC.self) {
                        mainRootVC.removeAllChildViewControllers()
//                        if let VC = UIStoryboard(name: "Logo", bundle: nil).instantiateViewController(withIdentifier: "Logo") as? LogoVC {
//                            VC.modalPresentationStyle = .fullScreen
//                            mainRootVC.present(VC, animated: false)
//                        }
                    }
                }
            }
            return false
        } else {//當我們按下刪除鍵時相當於輸入空字串
            textField.text = string
            //建立一個tag往前的響應者
            let nextResponder: UIResponder? = view.viewWithTag(textField.tag - 1)
            if (nextResponder != nil) {
            //只要響應者不是nil就讓他成為第一位響應者這樣就可以連續輸入時自動切到上一格
                nextResponder?.becomeFirstResponder()
            }
            return false
        }
    }
}

