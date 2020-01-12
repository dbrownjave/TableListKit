//
//  TableViewController.swift
//  TableView-Date-Sections-Demo
//
//  Created by Dorian Javaughn Brown on 11/15/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let reuseIdentifier = "cellIndentfier"
    
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
    
    
    private func setupTableview() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    private func fetchTransactions() {
        let transactions: [Transaction] = today + tomorrow + yesterday
        let sortedTransactions = transactions.sorted { $0.date < $1.date }
        let groupedTransactionsDict = sortedTransactions.groupedBy(dateComponents: [.day])
        let groupedTransactionsArr = Array(groupedTransactionsDict.values)
        groupedTransactions = groupedTransactionsArr
        tableView.reloadData()
    }
}

// MARK: - Table view data source

extension TableViewController {
    
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupedTransactions[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = indexPath.section
        let date = groupedTransactions[section][row].date.format()
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = "📦  \(date)"
        return cell
    }
}
