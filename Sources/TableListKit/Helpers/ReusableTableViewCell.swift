//
//  ReusableTableViewCell.swift
//  Wallit
//
//  Created by Dorian Javaughn Brown on 12/15/19.
//  Copyright © 2019 Magical X Labs. All rights reserved.
//

import UIKit


// MARK: - Reusable View
// let identifier = CustomCell.defaultReuseIdentifier
// identifier = "MyModule.CustomCell"


protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

// MARK - Reusable View
extension UITableViewCell: ReusableView {}
extension UICollectionViewCell: ReusableView {}

