//
//  Extension.swift
//  futures
//
//  Created by Claud on 2022/12/15.
//

import Foundation
import UIKit

fileprivate class RowInformation {
    var spacing: CGFloat
    var cells: [UICollectionViewCell] = [] {
        didSet {
            width = cells.reduce(0.0, { $0 + $1.intrinsicContentSize.width })
            if !cells.isEmpty {
                width += CGFloat(cells.count - 1) * spacing
            }
        }
    }
    var width: CGFloat = 0.0
    
    init(spacing: CGFloat) {
        self.spacing = spacing
    }
}

extension UITextField {
    
    func addBottomBorader(BoraderColor:UIColor){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
        bottomLine.backgroundColor = BoraderColor.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
    
    func addLeftViewIcon(image:UIImage){
        let leftImageView = UIImageView()
        leftImageView.tintColor = .white
        leftImageView.image = image
        let leftView = UIView()
        leftView.addSubview(leftImageView)
        leftView.frame = CGRectMake(0, 0, 30, 25)
        leftImageView.frame = CGRectMake(0, 0, 25, 25)
        self.leftViewMode = .always
        self.leftView = leftView
    }
    
    func addRightViewIcon(image:UIImage){
        let rightViewImageView = UIImageView()
        rightViewImageView.tintColor = .white
        rightViewImageView.image = image
        let rightView = UIView()
        rightView.addSubview(rightViewImageView)
        rightView.frame = CGRectMake(0, 0, 30, 25)
        rightViewImageView.frame = CGRectMake(0, 0, 25, 25)
        self.rightViewMode = .always
        self.rightView = rightView
    }
    
    func addRightViewButton(btn:UIButton){
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        btn.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        self.rightView = btn
        self.rightViewMode = .always
    }
    
    func changePlaceholder(placeholder:String, color:UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: placeholder,attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
}

extension Array where Element: Hashable  {
    
    func toData()-> Data? {
        return try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: true)
    }
    
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        return filter {
          addedDict.updateValue(true, forKey: $0) == nil
        }
     }
     mutating func removeDuplicates() {
        self = self.removingDuplicates()
     }
    
}

extension UIViewController {
    
    // With this extension you can access the MainViewController from the child view controllers.
    func revealViewController() -> UIViewController? {
        var viewController: UIViewController? = self
        
        if viewController != nil {
            return viewController
        }
        while (!(viewController != nil) && viewController?.parent != nil) {
            viewController = viewController?.parent
        }
        if viewController != nil {
            return viewController
        }
        return nil
    }
    
    func removeAllChildViewControllers() {
        guard self.children.count > 0 else { return }
        let viewControllers = self.children
        viewControllers.forEach({
            $0.dismiss(animated: false)
        })
    }
}

extension Double {
    func formatNumber() -> String {
        let formater = NumberFormatter()
        formater.groupingSeparator = ","
        formater.numberStyle = .decimal
        return formater.string(from: NSNumber(value: self))!
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat(hexNumber & 0x0000ff) / 255
                a = 1
                
                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }
        return nil
    }
}

extension UIButton {
    
    func defaultImageToRight(){
        if #available(iOS 15, *){
            self.configuration?.imagePlacement = .trailing
            self.configuration?.imagePadding = 10
        }else{
            self.semanticContentAttribute = .forceRightToLeft
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        }
    }
    
}

extension UITableView {
    
    func setSeparatorLocation(){
        self.separatorInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
}

extension CaseIterable where Self: Equatable {
    
    func next() -> Self {
        let all = Self.allCases
        let idx = all.firstIndex(of: self)!
        let next = all.index(after: idx)
        return all[next == all.endIndex ? all.startIndex : next]
    }
    
}

extension Notification.Name {
    static let removeBackground = Notification.Name("removeBackground")
    static let sideMenuAction = Notification.Name("sideMenuAction")
}

extension UIStackView {
    
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }
    
}

extension NSLayoutConstraint {
    
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
    
}

extension Encodable {
    
    var jsonString: String {
        guard let jsonData = try? JSONEncoder().encode(self),
              let jsonString = String(data: jsonData, encoding: .utf8)
        else {
            return ""
        }
        return jsonString
    }
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
    
}

extension String {
    
    static var uniqueString: String {
        UUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
    
}

extension UIView {
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self.next
        while parentResponder != nil {
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
            parentResponder = parentResponder?.next
        }
        return nil
    }
    
    func findParentViewController<T>(ofType type: T.Type) -> T? {
        var parentResponder: UIResponder? = self.next
        while parentResponder != nil {
            if let viewController = parentResponder as? T {
                return viewController
            }
            parentResponder = parentResponder?.next
        }
        return nil
    }
    
}

extension NibOwnerLoadable {
    
    static var nib:UINib {
        UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

extension NibOwnerLoadable where Self:UIView {
    
    func loadNibContent() {
        guard let views = Self.nib.instantiate(withOwner: self, options: nil) as? [UIView],
        let contentView = views.first else {
            fatalError("Fail to load \(self) nib content")
        }
        self.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension UIImage {

    func resize(targetSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size:targetSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}

extension UICollectionView {
    func getOptimalCells(_ cells: [UICollectionViewCell], maxWidth: CGFloat) -> [UICollectionViewCell] {
        var rows: [RowInformation] = []
        let spacing = (self.collectionViewLayout
            as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0.0
        
        var cellsCopy = cells
        cellsCopy.sort(by: { $0.intrinsicContentSize.width > $1.intrinsicContentSize.width })
        
        cellsCopy.forEach { (cell) in
            var isAdded: Bool = false
            for row in rows {
                if row.width + cell.intrinsicContentSize.width + spacing < maxWidth {
                    row.cells.append(cell)
                    isAdded = true
                    break
                }
            }
            if !isAdded {
                let newRow = RowInformation(spacing: spacing)
                newRow.cells.append(cell)
                rows.append(newRow)
            }
        }
        
        cellsCopy = rows.reduce(into: [UICollectionViewCell](), { (cells, row) in
            cells.append(contentsOf: row.cells)
        })
        
        return cellsCopy
    }
}

extension CACornerMask {
    
    static let topLeft:CACornerMask = .layerMinXMinYCorner
    
    static let topRight:CACornerMask = .layerMaxXMinYCorner
    
    static let bottomLeft:CACornerMask = .layerMinXMaxYCorner
    
    static let bottomRight:CACornerMask = .layerMinXMaxYCorner
    
    static let all:CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMaxYCorner]
    
    static let none:CACornerMask = []
    
    static let top:CACornerMask = [.topLeft, .topRight]
    
    static let bottom:CACornerMask = [.bottomLeft, .bottomRight]
    
}
