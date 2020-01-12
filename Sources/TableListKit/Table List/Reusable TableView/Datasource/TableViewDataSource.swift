//
//  UITableViewDataSource.swift
//  NewspaperExample
//
//  Created by Dorian Javaughn Brown on 11/4/19.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit

public class TableViewDataSource<Model, Cell: UITableViewCell>: NSObject, UITableViewDataSource {
    public typealias CellConfigurator = (Model,  Cell) -> ()
    
    public var models: [Model]
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    
    public init(models: [Model],
         cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.cellConfigurator = cellConfigurator
        self.reuseIdentifier = Cell.reuseIdentifier
    }
    
    // MARK: - Tableview Data Source
    public func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    public func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueNibCell(cellClass: Cell.self)
        cellConfigurator(model, cell)
        return cell
    }
}
