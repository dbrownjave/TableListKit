//
//  UITableView+Extensions.swift
//  ReusableGenericUITableView
//
//  Created by Dorian Javaughn Brown on 10/22/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//

import UIKit


public extension UITableView {
    // MARK: - Setup
    func setup<T: UITableViewCell>(delegate: UITableViewDelegate?,
                                          dataSource: UITableViewDataSource?,
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
    
    func register<T: UITableViewCell>(_: T.Type) {
        
        print("Registing Cell:", T.Type.self)
        print("Cell Indentifer:", T.reuseIdentifier)
        
        if T.self == UITableViewCell.self {
            register(UITableViewCell.self, forCellReuseIdentifier: T.reuseIdentifier)
            return
        }
        
        /// find custom cell NIB
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    // MARK: - Dequeue Cell
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueNibCell<Cell: UITableViewCell>(cellClass: Cell.Type) -> Cell {
        let cellName = String(describing: cellClass)
        if let cell = self.dequeueReusableCell(withIdentifier: cellName) as? Cell {
            return cell
        }
        let nib = UINib(nibName: cellName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: cellName)
        return self.dequeueReusableCell(withIdentifier: cellName) as! Cell
    }
    
}
