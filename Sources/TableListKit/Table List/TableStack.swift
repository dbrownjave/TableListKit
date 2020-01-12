//
//  TableStack.swift
//  TableView-Date-Sections-Demo
//
//  Created by Dorian Javaughn Brown on 12/18/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//


import UIKit


// MARK: - Does not support non NIB TableView Cell


public extension UITableView {
    // gets tablecell
    func stack<Cell: UITableViewCell>(_ cell: Cell) -> Cell {
        let reuseIdentifier = Cell.reuseIdentifier
        
        if reuseIdentifier == "UITableViewCell" { return Cell() }
        
//        print("reuseIdentifier", reuseIdentifier)

        if let cell = self.dequeueReusableCell(withIdentifier: reuseIdentifier) as? Cell {
            return cell
        }
        
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: reuseIdentifier)
        return self.dequeueReusableCell(withIdentifier: reuseIdentifier) as! Cell
    }
}
