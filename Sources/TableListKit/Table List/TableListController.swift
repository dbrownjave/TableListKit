//
//  File.swift
//  
//
//  Created by Dorian Javaughn Brown on 1/14/20.
//

import UIKit

open class TableListController: UITableViewController {
    
    open var tableList: UITableView = UITableView()
    
    public override init(style: UITableView.Style) {
        super.init(style: style)
        self.tableList = self.tableView
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
