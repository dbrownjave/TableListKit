
//
//  TableViewController.swift
//  TableView-Date-Sections-Demo
//
//  Created by Dorian Javaughn Brown on 11/15/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//
// Reference:
// https://www.swiftbysundell.com/articles/reusable-data-sources-in-swift/
// https://medium.com/ios-os-x-development/a-better-exhaustive-switch-in-uitableview-protocols-c770200c9ffa
// https://medium.com/@aunnnn/table-header-view-with-autolayout-13de4cfc4343

import UIKit
import TableListKit

class MultiCellTableListController: TableListController {
    
    // transactions
    let today = Array(repeating: Transaction(date: Date()), count: 6)
    var transactions: [Transaction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        fetchTransactions()
        setupTableview()
    }
    
    private func fetchTransactions() {
        transactions = today
        let sortedTransactions = transactions.sorted { $0.date > $1.date }
        transactions = sortedTransactions
        tableView.reloadData()
    }
}

// MARK: - Tableview Datasource

extension MultiCellTableListController {
    private func setupTableview() {
        tableList.setup(delegate: self, dataSource: self)
        tableList.reloadData()
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = AppStoreHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 300))
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let row = indexPath.row
        return tableListCell(forRow: row)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        18
    }
}


// MARK: - Table Stacking Datasource
extension MultiCellTableListController: TableListCellDataSource {
    
    /// Returns a cell from the given row index location of the tablelist 
    func tableListCell(forRow row: Int) -> UITableViewCell {
        switch row {
        case 0...3:
            let cell = tableView.stack(SwitchCell())
            cell.textLabel?.text = "Face ID"
            return cell
        case 4...6:
            let cell = tableView.stack(UITableViewCell())
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.secondarySystemBackground
            cell.textLabel?.text = "📦  \(transactions[0].date.format())"
            return cell
        case 7...8:
            let cell = tableView.stack(UITableViewCell())
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = "Tansactions"
            return cell
        case 9...18:
            let cell = tableView.stack(UITableViewCell())
            cell.selectionStyle = .none
            cell.textLabel?.text = "🚖"
            return cell
        default:
            return UITableViewCell()
        }
    }
}
