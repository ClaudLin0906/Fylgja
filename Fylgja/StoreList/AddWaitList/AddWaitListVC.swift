//
//  AddWaitListVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/22.
//

import UIKit

class AddWaitListVC: UIViewController {
    
    @IBOutlet weak var maleRadioBtn:RadioButton!
    
    @IBOutlet weak var femaleRadioBtn:RadioButton!
    
    @IBOutlet weak var otherRadioBtn:RadioButton!
    
    private lazy var radioButtonController = RadioButtonController(buttons: [maleRadioBtn, femaleRadioBtn, otherRadioBtn])

    override func viewDidLoad() {
        super.viewDidLoad()
        UIInit()
        // Do any additional setup after loading the view.
    }
    
    private func UIInit() {
        radioButtonController.delegate = self
    }

}


extension AddWaitListVC: RadioButtonControllerDelegate {
    
    func didSelectedButton(_ radioButtonController: RadioButtonController, _ currentSelectedButton: RadioButton?) {
        print(currentSelectedButton)
    }
    
}
