
//
//  TableStack.swift
//  TableView-Date-Sections-Demo
//
//  Created by Dorian Javaughn Brown on 12/18/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//


import UIKit


// MARK: - Does not support non NIB TableView Cell

//
//extension UICollectionView {
//    // gets tablecell
//    func stack<Cell: UICollectionViewCell>(_ cell: Cell) -> Cell {
//        let reuseIdentifier = Cell.reuseIdentifier
//        
//        if reuseIdentifier == "UICollectionViewCell" { return Cell() }
//        
////        print("reuseIdentifier", reuseIdentifier)
//
//        if let cell = self.dequeueReusableCell(withIdentifier: reuseIdentifier) as? Cell {
//            return cell
//        }
//        
//        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
//        self.register(nib, forCellReuseIdentifier: reuseIdentifier)
//        return self.dequeueReusableCell(forIndexPath: reuseIdentifier) as! Cell
//    }
//}
