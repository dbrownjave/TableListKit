//
//  ConfigurableCell.swift
//  Wallit
//
//  Created by Dorian Javaughn Brown on 12/15/19.
//  Copyright © 2019 Magical X Labs. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
    associatedtype DataType
    
    var touched: (() -> ())? { get set}
    
    func configure(with model: DataType)
}
