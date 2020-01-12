//
//  NibCellView.swift
//  Wallit
//
//  Created by Dorian Javaughn Brown on 12/15/19.
//  Copyright © 2019 Magical X Labs. All rights reserved.
//

import UIKit

// MARK: - Nib Loadable View
// let nibName = BookCell.nibName
// nibName = "BookCell"


//protocol NibLoadableView: class {
//    static var nibName: String { get }
//}

public protocol NibCellView: class {
    static var nibName: String { get }
}

extension NibCellView where Self: UIView {
    public static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

// extension UIView: NibLoadableView {}
extension UITableViewCell: NibCellView {}
extension UICollectionViewCell: NibCellView {}


/// A base UIView subclass that instaniates a view
/// from a nib file of the same class name in order to
/// allow reusable views to be created.
internal protocol NibView where Self: UIView {
    
}


