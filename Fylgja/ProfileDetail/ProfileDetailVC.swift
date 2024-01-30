//
//  ProfileDetailVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/30.
//

import UIKit

class ProfileDetailVC: CustomVC {
    
    @IBOutlet weak var profileDetailTableView:UITableView!
    
    private var tableViewData:[ProfileDetailTableViewInfo] =
        [
            ProfileDetailTableViewInfo(category: .name, categoryInfo: "name"),
            ProfileDetailTableViewInfo(category: .gender, categoryInfo: "gender"),
            ProfileDetailTableViewInfo(category: .birthdayDate, categoryInfo: "birthdayDate"),
            ProfileDetailTableViewInfo(category: .email, categoryInfo: "email"),
            ProfileDetailTableViewInfo(category: .phone, categoryInfo: "phone"),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "個人資料"
        UIInit()
        // Do any additional setup after loading the view.
    }
    
    private func UIInit() {
        setDefaultNavigationBackBtn()
        profileDetailTableView.setSeparatorLocation()
    }

}

extension ProfileDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileDetailDefaultTableViewCell.identifier, for: indexPath) as! ProfileDetailDefaultTableViewCell
        cell.setCell(tableViewData[row])
        return cell
    }
    
    
}
