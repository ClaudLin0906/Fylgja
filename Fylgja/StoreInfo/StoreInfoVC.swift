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
        case 1:
            let storeInfoTableViewHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "StoreInfoTableViewHeaderView") as! StoreInfoTableViewHeaderView
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
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        guard section == 1 else { return nil }
//        let storeInfoTableViewFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "StoreInfoTableViewFooterView") as! StoreInfoTableViewFooterView
//        return storeInfoTableViewFooterView
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var result = 0
        switch section {
        case 4:
            result = 8
        default:
            result = 1
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
            return cell
        case (4, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: BusinessTimeTableViewCell.identifier, for: indexPath) as! BusinessTimeTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }
    
    
}

//class StoreInfoVC: CustomVC {
//
//    @IBOutlet weak var step2View:UIView!
//
//    @IBOutlet weak var mapView:GMSMapView!
//
//    @IBOutlet weak var phoneNumberConnectView:ConnectInfoView!
//
//    @IBOutlet weak var addressConnectView:ConnectInfoView!
//
//    @IBOutlet weak var businessTimeTableView:UITableView!
//
//    private var isExpand = false // cell 的狀態(展開/縮合)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "商家資訊"
//        UIInit()
//        // Do any additional setup after loading the view.
//    }
//
//    private func UIInit() {
//        step2View.layer.maskedCorners = .top
//        let tintColor = #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1)
//        addressConnectView.imageView.image = UIImage(systemName: "mappin")?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
//        addressConnectView.label.text = "台中市豐原區中山路99巷12弄10號"
//        phoneNumberConnectView.imageView.image = UIImage(systemName: "phone")?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
//        phoneNumberConnectView.label.text = "0932266860"
//        mapView.mapType = .normal
//        mapView.delegate = self
//        mapView.settings.compassButton = true
//        mapView.settings.myLocationButton = false
//        mapView.isMyLocationEnabled = true
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        setDefaultNavigationBackBtn()
//    }
//
//}
//
extension StoreInfoVC: GMSMapViewDelegate {

    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("Current location: <\(coordinate.latitude), \(coordinate.longitude)>")
    }

    func mapView(_ mapView: GMSMapView, didTapMyLocation location: CLLocationCoordinate2D) {
        print("Current location: <\(location.latitude), \(location.longitude)>")
    }

}
//
//extension StoreInfoVC: UITableViewDelegate {
//
//
//}
//
//extension StoreInfoVC: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if isExpand {
//            return 7
//        }
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: BusinessTimeTableViewHeaderCell.identifier, for: indexPath) as! BusinessTimeTableViewHeaderCell
//            cell.delegate = self
//            return cell
//        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: BusinessTimeTableViewCell.identifier, for: indexPath) as! BusinessTimeTableViewCell
//        return cell
//    }
//
//}
//
//extension StoreInfoVC: BusinessTimeTableViewHeaderCellDelegate {
//
//    func pressBtn(_ sender: UIButton) {
//        DispatchQueue.main.async { [self] in
//            isExpand = !isExpand
//            businessTimeTableView.reloadSections(IndexSet(integer: 0), with: .automatic)
//        }
//    }
//
//}
