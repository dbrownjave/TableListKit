
//
//  TableViewController.swift
//  TableView-Date-Sections-Demo
//
//  Created by Dorian Javaughn Brown on 11/15/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//
// Reference:
// https://www.swiftbysundell.com/articles/reusable-data-sources-in-swift/

import UIKit
import TableListKit

class TableListSectionMultiCells: UITableViewController {
    // 1. Configure datasource
    var dataSource: SectionTableViewDataSource?
    
    // transactions
    let today = Array(repeating: Transaction(date: Date()), count: 6)

    var sectionTitles = ["Receipts", "Security"]
    var groupedTransactions = [[Transaction]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        fetchTransactions()
        setupTableview()
    }
    
    private func fetchTransactions() {
        let transactions: [Transaction] = today
        let sortedTransactions = transactions.sorted { $0.date > $1.date }
        let groupedTransactionsDict = sortedTransactions.groupedBy(dateComponents: [.day])
        let groupedTransactionsArr = Array(groupedTransactionsDict.values)
        groupedTransactions = groupedTransactionsArr
        tableView.reloadData()
    }
}

// MARK: - Tableview Datasource

extension TableListSectionMultiCells {
    private func setupTableview() {
        // 1. data source
        let switchDataSource = TableViewDataSource<SwitchCellModel, SwitchCell>(models: [SwitchCellModel(isOn: true)]) { (_, cell) in
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.secondarySystemBackground
            cell.textLabel?.text = "Face ID"
        }
        
        // 2. table section
        let switchTableSection = TableSection(dataSource: switchDataSource,
                                              models: [SwitchCellModel(isOn: true)],
                                              footerView: UIView())
        
        
        let dataSource = SectionTableViewDataSource(tableViewSections: [
            TableSection.make(for: groupedTransactions[0]),
            switchTableSection,
        ])
        
        self.dataSource = dataSource
        tableView.sectionHeaderHeight = 50.0
        tableView.setup(delegate: self,
                        dataSource: dataSource,
                        cell: UITableViewCell.self)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 50.0, y: 0, width: 0, height: 0))
        label.text = sectionTitles[section]
        label.textColor = UIColor.secondaryLabel
        label.font = UIFont.systemFont(ofSize: 20.0)
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupedTransactions.count
    }
    
    
}

