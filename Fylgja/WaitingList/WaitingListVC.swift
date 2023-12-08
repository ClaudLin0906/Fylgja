//
//  WaitingListVC.swift
//  Fylgja
//
//  Created by 林書郁 on 2023/11/25.
//

import UIKit

class WaitingListVC: CustomRootVC {
    
    @IBOutlet weak var tableView:UITableView!
    
    @IBOutlet weak var noDataView:UIView!
    
    private var tableData:[Int] = []
    {
        willSet{
            if newValue.count > 0 {
                tableView.isHidden = false
            } else {
                tableView.isHidden = true
            }
        }
    }
    
    private var scanBtn: ScanBtn = {
        let scanBtn = ScanBtn()
        scanBtn.layer.cornerRadius = 25
        scanBtn.translatesAutoresizingMaskIntoConstraints = false
        return scanBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        tableData.append(contentsOf: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        tableData.removeAll()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scanBtnInit()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        scanBtn.removeFromSuperview()
    }
    
    func scanBtnInit() {
        scanBtn.clipsToBounds = true
        scanBtn.btn.addTarget(self, action: #selector(scanBtnHandle(_:)), for: .touchUpInside)
        view.addSubview(scanBtn)
        scanBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        scanBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        scanBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        scanBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func scanBtnHandle(_ sender:UIButton) {
        
    }

}

extension WaitingListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WaitingTableViewCell.identifier) as! WaitingTableViewCell
        return cell
    }
    
}

extension WaitingListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
