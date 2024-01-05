//
//  StoreInfoVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/12/17.
//

import UIKit
import GoogleMaps
import GooglePlaces

class StoreInfoVC: CustomVC {
    
    @IBOutlet weak var storeInfoTableView:UITableView!
    
    @IBOutlet weak var storeInfoTableViewContentHeight:NSLayoutConstraint!
    
    private var isExpand = false // cell 的狀態(展開/縮合)
    {
        willSet {
            if newValue {
                storeInfoTableViewContentHeight.constant = expand
            } else {
                storeInfoTableViewContentHeight.constant = noExpand
            }
        }
    }
    
    private var noExpand:CGFloat = 1300
    
    private var expand:CGFloat = 1600
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "商家資訊"
        UIInit()
        // Do any additional setup after loading the view.
    }
    
    private func UIInit() {
        storeInfoTableView.register(UINib(nibName: "StoreInfoTableViewProfileHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "StoreInfoTableViewProfileHeaderView")
        storeInfoTableView.register(UINib(nibName: "StoreInfoTableViewHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "StoreInfoTableViewHeaderView")
        storeInfoTableView.register(UINib(nibName: "StoreInfoTableViewFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "StoreInfoTableViewFooterView")
        storeInfoTableView.register(UINib(nibName: "StoreInfoHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "StoreInfoHeaderView")


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDefaultNavigationBackBtn()
    }
    
}

extension StoreInfoVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        switch section {
        case 0:
            let storeInfoTableViewProfileHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "StoreInfoTableViewProfileHeaderView") as! StoreInfoTableViewProfileHeaderView
            return storeInfoTableViewProfileHeaderView
        case 1, 6:
            var title = ""
            if section == 1 {
                title = "商家資訊"
            }
            if section == 6 {
                title = "菜單"
            }
            
            let storeInfoTableViewHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "StoreInfoTableViewHeaderView") as! StoreInfoTableViewHeaderView
            storeInfoTableViewHeaderView.titleLabel.text = title
            return storeInfoTableViewHeaderView
            
        default:
            var title = ""
            if section == 2 {
                title = "商家地址"
            }
            if section == 3 {
                title = "聯絡電話"
            }
            if section == 4 {
                title = "營業時間"
            }
            if section == 5 {
                title = "商家標籤"
            }
            let storeInfoHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "StoreInfoHeaderView") as! StoreInfoHeaderView
            storeInfoHeaderView.titleLabel.text = title
            return storeInfoHeaderView
        }

    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard section == 7 else { return nil }
        let storeInfoTableViewFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "StoreInfoTableViewFooterView") as! StoreInfoTableViewFooterView
        return storeInfoTableViewFooterView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var result = 1
        switch section {
        case 4:
            if isExpand {
                result = 8
            }
        default:
            break
        }
        return result
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        let tintColor = #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1)
        switch (section, row) {
        case (0, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoreInfoIntroduceTableViewCell", for: indexPath) as! StoreInfoIntroduceTableViewCell
            return cell
        case (1, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoreInfoMapTableViewCell", for: indexPath) as! StoreInfoMapTableViewCell
            cell.mapView.delegate = self
            return cell
        case (2, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoreInfoTableViewCell", for: indexPath) as! StoreInfoTableViewCell
            cell.iconImageView.image = UIImage(systemName: "mappin")?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
            cell.infoLabel.text = "台中市豐原區中山路99巷12弄10號"
            return cell
        case (3, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoreInfoTableViewCell", for: indexPath) as! StoreInfoTableViewCell
            cell.iconImageView.image = UIImage(systemName: "phone")?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
            cell.infoLabel.text = "0932266860"
            return cell
        case (4, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: BusinessTimeCurrentDayTableViewCell.identifier, for: indexPath) as! BusinessTimeCurrentDayTableViewCell
            cell.btnExpandBtn.addTarget(self, action: #selector(changeExpandStatus(_:)), for: .touchUpInside)
            return cell
        case (4, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: BusinessTimeTableViewCell.identifier, for: indexPath) as! BusinessTimeTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    @objc private func changeExpandStatus(_ sender:UIButton) {
        isExpand = !isExpand
        DispatchQueue.main.async {
            self.storeInfoTableView.reloadSections(IndexSet(integer: 4), with: .automatic)
        }
    }
    
    
}

extension StoreInfoVC: GMSMapViewDelegate {

    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("Current location: <\(coordinate.latitude), \(coordinate.longitude)>")
    }

    func mapView(_ mapView: GMSMapView, didTapMyLocation location: CLLocationCoordinate2D) {
        print("Current location: <\(location.latitude), \(location.longitude)>")
    }

}
