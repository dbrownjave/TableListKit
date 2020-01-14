//
//  File.swift
//  
//
//  Created by Dorian Javaughn Brown on 1/12/20.
//

import UIKit

public protocol TableListCellDataSource: class {
    func tableListCell(forRow row: Int) -> UITableViewCell
}
