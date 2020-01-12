//
//  UITableView+Extensions.swift
//  ReusableGenericUITableView
//
//  Created by Dorian Javaughn Brown on 10/22/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//

import UIKit


extension UICollectionView {
    // MARK: - Setup
    public func setup<T: UICollectionViewCell>(delegate: UICollectionViewDelegate?,
                                          dataSource: UICollectionViewDataSource?,
                                          cell: T.Type) {
        register(cell)
        if let delegate = delegate, let dataSource = dataSource {
            self.delegate =  delegate
            self.dataSource = dataSource
        }
    }
    

    
    // MARK: - Register Cell
//    func register<T: UITableViewCell>(_: T.Type) {
//        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
//    }
    
    public func register<T: UICollectionViewCell>(_: T.Type) {
        
        print("Registing Cell:", T.Type.self)
        print("Cell Indentifer:", T.reuseIdentifier)
        
        if T.self == UICollectionViewCell.self {
            register(UICollectionViewCell.self, forCellWithReuseIdentifier: T.reuseIdentifier)
            return
        }
        
        /// find custom cell NIB
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    // MARK: - Dequeue Cell
    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    public func dequeueNibCell<Cell: UICollectionViewCell>(cellClass: Cell.Type, forIndexPath indexPath: IndexPath) -> Cell {
        let cellName = String(describing: cellClass)
        if let cell = self.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as? Cell {
            return cell
        }
        let nib = UINib(nibName: cellName, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: cellName)
        return self.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! Cell
    }
    
}
