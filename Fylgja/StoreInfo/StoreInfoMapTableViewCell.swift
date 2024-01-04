//
//  StoreInfoMapTableViewCell.swift
//  Fylgja
//
//  Created by 林書郁 on 2024/1/4.
//

import UIKit
import GoogleMaps
import GooglePlaces

class StoreInfoMapTableViewCell: UITableViewCell {
    
    static let identifier = "StoreInfoMapTableViewCell"
    
    @IBOutlet weak var mapView:GMSMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        mapView.mapType = .normal
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = false
        mapView.isMyLocationEnabled = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
