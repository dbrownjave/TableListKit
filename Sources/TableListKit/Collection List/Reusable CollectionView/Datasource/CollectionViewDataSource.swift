//
//  UITableViewDataSource.swift
//  NewspaperExample
//
//  Created by Dorian Javaughn Brown on 11/4/19.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit

public class CollectionViewDataSource<Model, Cell: UICollectionViewCell>: NSObject, UICollectionViewDataSource {
    
    
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
    
    // MARK: - CollectionView Data Source
    public func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int
    ) -> Int {
        return models.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueNibCell(cellClass: Cell.self, forIndexPath: indexPath)
        cellConfigurator(model, cell)
        return cell
    }
}
