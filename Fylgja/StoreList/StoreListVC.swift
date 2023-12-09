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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StoreListVC: UITableViewDelegate {
    
}

extension StoreListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoreListTableViewCell.identifier, for: indexPath) as! StoreListTableViewCell
        if indexPath.row % 2 == 1 {
            cell.setCell(.open, ["義大利麵", "輕食", "排餐"])
        }
        if indexPath.row % 2 == 0 {
            cell.setCell(.close, ["炸物", "茶飲", "排餐"])
        }
        return cell
    }
    
}
