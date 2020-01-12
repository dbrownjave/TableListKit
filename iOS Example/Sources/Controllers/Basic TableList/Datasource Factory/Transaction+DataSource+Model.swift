//
//  Transaction+DataSource+Model.swift
//  TableView-Date-Sections-Demo
//
//  Created by Dorian Javaughn Brown on 11/15/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//

import UIKit
import TableListKit
//
//extension TableViewDataSource where Model == Transaction {
//    static func make(for transactions: [Transaction],
//                     reuseIdentifier: String = "message") -> TableViewDataSource {
//        return TableViewDataSource(
//            models: transactions
//        ) { transaction, cell in
//            cell.selectionStyle = .none
//            cell.backgroundColor = UIColor.secondarySystemBackground
//            cell.textLabel?.text = "📦  \(transaction.date.format())"
//        }
//    }
//}

extension TableSection where Model == Transaction {
    static func make(for transactions: [Transaction],
                     reuseIdentifier: String = "message") -> TableSection {
        
        // 1. data source
        let ds = TableViewDataSource<Model, Cell>(models: transactions) { (transaction, cell) in
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.secondarySystemBackground
            cell.textLabel?.text = "📦  \(transaction.date.format())"
        }
        
        // 2. table section
        return TableSection(dataSource: ds, models: transactions)
    }
}
