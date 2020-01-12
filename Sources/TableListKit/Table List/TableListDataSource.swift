//
//  TableListDataSource.swift
//  Wallit
//
//  Created by Dorian Javaughn Brown on 12/15/19.
//  Copyright © 2019 Magical X Labs. All rights reserved.
//

import UIKit

public protocol TableListDataSource: class {
    associatedtype CellModel
    
    var cellModels: [CellModel] { get set }
}

