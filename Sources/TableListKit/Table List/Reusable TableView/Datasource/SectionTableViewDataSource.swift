//
//  UITableViewDataSource.swift
//  NewspaperExample
//
//  Created by Dorian Javaughn Brown on 11/4/19.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit

public class SectionTableViewDataSource: NSObject {
    private var dataSources: [UITableViewDataSource] = []
    private var tableViewSections: [TableSectionItem]
    
    public init(tableViewSections: [TableSectionItem]) {
        self.tableViewSections = tableViewSections
        
        /// assign datasources
        /// set identifiers
        for (index, section) in  tableViewSections.enumerated() {
            self.tableViewSections[index].id = index
            self.dataSources.append(section.dataSource)
        }
    }
}


// MARK: - Tableview Data Source
extension SectionTableViewDataSource: UITableViewDataSource {
    
    /// Number of sections
    public func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSections.count
    }
    
    /// Number of rows in section
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewSections[section].numberOfItemsInSection
    }
    
    /// Returns TableView Cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let dataSource = dataSources[section]
        let indexPath = IndexPath(row: indexPath.row, section: 0)
        let cell = dataSource.tableView(tableView, cellForRowAt: indexPath)
        return cell
    }
    
    // Create a standard header that includes the returned text.
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let tvs = tableViewSections[exist: section],
            tvs.headerType == .standard,
            let title = tvs.headerTitle else {
                return nil
        }
        
        return title
        
    }
    
    // Create a standard footer that includes the returned text.
    public func tableView(_ tableView: UITableView,
                   titleForFooterInSection section: Int
    ) -> String? {
        guard let tvs = tableViewSections[exist: section], tvs.footerType == .standard,
            let title = tvs.footerTitle else {
                return nil
        }
        return title
    }
}

