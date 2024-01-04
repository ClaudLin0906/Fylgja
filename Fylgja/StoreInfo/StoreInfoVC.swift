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
    
    @IBOutlet weak var step2View:UIView!
    
    @IBOutlet weak var mapView:GMSMapView!
    
    @IBOutlet weak var phoneNumberConnectView:ConnectInfoView!
    
    @IBOutlet weak var addressConnectView:ConnectInfoView!
    
    @IBOutlet weak var businessTimeTableView:UITableView!
    
    private var isExpand = false // cell 的狀態(展開/縮合)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "商家資訊"
        UIInit()
        // Do any additional setup after loading the view.
    }
    
    private func UIInit() {
        step2View.layer.maskedCorners = .top
        let tintColor = #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1)
        addressConnectView.imageView.image = UIImage(systemName: "mappin")?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
        addressConnectView.label.text = "台中市豐原區中山路99巷12弄10號"
        phoneNumberConnectView.imageView.image = UIImage(systemName: "phone")?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
        phoneNumberConnectView.label.text = "0932266860"
        mapView.mapType = .normal
        mapView.delegate = self
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = false
        mapView.isMyLocationEnabled = true
//        businessTimeTableView.register(UINib(nibName: "BusinessTimeTableHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "BusinessTimeTableHeaderView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDefaultNavigationBackBtn()
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

extension StoreInfoVC: UITableViewDelegate {
    
    
}

extension StoreInfoVC: UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let businessTimeTableHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "BusinessTimeTableHeaderView") as! BusinessTimeTableHeaderView
//        businessTimeTableHeaderView.delegate = self
////        let tintColor = #colorLiteral(red: 0.4235294118, green: 0.4235294118, blue: 0.4235294118, alpha: 1)
////        businessTimeTableHeaderView.businessTimeConnectInfoView.imageView.image = UIImage(systemName: "clock.fill")?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
//        return businessTimeTableHeaderView
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isExpand {
            return 7
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BusinessTimeTableViewHeaderCell.identifier, for: indexPath) as! BusinessTimeTableViewHeaderCell
            cell.delegate = self
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: BusinessTimeTableViewCell.identifier, for: indexPath) as! BusinessTimeTableViewCell
        return cell
    }
    
}

extension StoreInfoVC: BusinessTimeTableViewHeaderCellDelegate {
    
    func pressBtn(_ sender: UIButton) {
        DispatchQueue.main.async { [self] in
            isExpand = !isExpand
            businessTimeTableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
    }
    
}
