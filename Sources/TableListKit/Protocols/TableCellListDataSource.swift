//
//  File.swift
//  
//
//  Created by Dorian Javaughn Brown on 1/12/20.
//

import UIKit

public protocol TableCellListDataSource: class {
    func getCell(forRow row: Int) -> UITableViewCell
}
