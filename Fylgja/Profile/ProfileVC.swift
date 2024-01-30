//
//  ProfileVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/10.
//

import UIKit

class ProfileVC: CustomRootVC {
    
    @IBOutlet weak var tableView:UITableView!
    
    private var tableViewData:[ProfileInfo] =
    [
        ProfileInfo(image: UIImage(systemName: "person")!, title: "個人資料"),
        ProfileInfo(image: UIImage(systemName: "gearshape")!, title: "預設候位訊息"),
        ProfileInfo(image: UIImage(systemName: "link")!, title: "第三方帳號綁"),
        ProfileInfo(image: UIImage(named: "faceID")!, title: "生物辨識登入",type: .swi),
        ProfileInfo(image: UIImage(systemName: "pencil.line")!, title: "意見反饋"),
        ProfileInfo(image: UIImage(systemName: "exclamationmark.circle")!, title: "關於我們"),
        ProfileInfo(image: UIImage(systemName: "lock.shield")!, title: "隱私協議"),
        ProfileInfo(image: UIImage(named: "version")!, title: "版本號", type: .ver),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        UIInit()
        // Do any additional setup after loading the view.
    }
    
    private func UIInit() {
        tableView.setSeparatorLocation()
        tableView.register(UINib(nibName: "ProfileTableFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "ProfileTableFooterView")

    }

}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        switch row {
        case 0:
            if let VC = UIStoryboard(name: "ProfileDetail", bundle: nil).instantiateViewController(withIdentifier: "ProfileDetail") as? ProfileDetailVC, let navigation = self.navigationController {
                pushVC(targetVC: VC, navigation: navigation)
            }
        default:
            print(row)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let profileTableFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileTableFooterView") as! ProfileTableFooterView
        profileTableFooterView.contentView.backgroundColor = .white
        profileTableFooterView.backgroundView?.backgroundColor = .white
        return profileTableFooterView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = tableViewData[indexPath.row]
        switch info.type {
        case .swi:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewSwtichCell.identifier, for: indexPath) as! ProfileTableViewSwtichCell
            cell.setCell(info)
            return cell
        case .ver:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewLabelCell.identifier, for: indexPath) as! ProfileTableViewLabelCell
            cell.setCell(info)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewDefaultCell.identifier, for: indexPath) as! ProfileTableViewDefaultCell
            cell.setCell(tableViewData[indexPath.row])
            return cell
        }

    }
    
}
