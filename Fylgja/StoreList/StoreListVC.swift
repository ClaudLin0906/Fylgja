//
//  StoreListVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/8.
//

import UIKit

class StoreListVC: CustomRootVC {
    
    @IBOutlet weak var tableView:UITableView!
    
    @IBOutlet weak var searchView:SearchView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIInit()
        // Do any additional setup after loading the view.
    }
    
    private func UIInit(){
        searchView.filterBtn.addTarget(self, action: #selector(filterBtn(_:)), for: .touchUpInside)
    }
    
    @objc private func filterBtn(_ sender:UIButton) {
        if let filterVC = UIStoryboard(name: "Filter", bundle: nil).instantiateViewController(withIdentifier: "Filter") as? FilterVC {
            showSheetVC(self, filterVC, [.medium(), .large()])
        }
    }

}

extension StoreListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let navigationController = self.navigationController, let VC = UIStoryboard(name: "StoreInfo", bundle: Bundle.main).instantiateViewController(identifier: "StoreInfo") as? StoreInfoVC {
            pushVC(targetVC: VC, navigation: navigationController)
        }
    }
    
}

extension StoreListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row % 3 == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: StoreListTableViewCell.identifier, for: indexPath) as! StoreListTableViewCell
        if row >= 3 && row % 3 == 2 {
            cell.setCell(.open, ["義大利麵", "輕食", "排餐"])
            return cell
        }
        if row >= 3 && row % 3 == 0 {
            cell.setCell(.close, ["炸物", "茶飲", "排餐"])
            return cell
        }
        cell.setCell(.open, ["牛排", "排餐"])
        return cell
    }
    
}

extension StoreListVC: UIViewControllerTransitioningDelegate, UISheetPresentationControllerDelegate {
    
}
