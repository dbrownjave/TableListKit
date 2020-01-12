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

class TableKitController: UITableViewController {
    // 1. Configure datasource
    var dataSource: SectionTableViewDataSource?
    
    // transactions
    let today = Array(repeating: Transaction(date: Date()), count: 6)
    let yesterday = Array(repeating: Transaction(date: Date().addDays(-1)), count: 2)
    let tomorrow = Array(repeating: Transaction(date: Date().addDays(1)), count: 4)
    
    var sectionTitles = ["Today", "Yesterday", "Tomorrow"]
    var groupedTransactions = [[Transaction]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        fetchTransactions()
        setupTableview()
    }
    
    private func fetchTransactions() {
        let transactions: [Transaction] = today + tomorrow + yesterday
        let sortedTransactions = transactions.sorted { $0.date > $1.date }
        let groupedTransactionsDict = sortedTransactions.groupedBy(dateComponents: [.day])
        let groupedTransactionsArr = Array(groupedTransactionsDict.values)
        groupedTransactions = groupedTransactionsArr
        tableView.reloadData()
    }
}

// MARK: - Tableview Datasource

extension TableKitController {
    private func setupTableview() {
        let dataSource = SectionTableViewDataSource(tableViewSections: [
            TableSection.make(for: groupedTransactions[0]),
            TableSection.make(for: groupedTransactions[1]),
            TableSection.make(for: groupedTransactions[2])
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
