//
//  TableCell.swift
//  CreditPal
//
//  Created by Dorian Javaughn Brown on 12/1/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//

import UIKit

open class TableCell<Model>: UITableViewCell, ConfigurableCell {
    public var touched: (() -> ())?
    
    public typealias DataType = Model
    
    func setupIU() {
         addGestureRecognizers()
    }

    private func addGestureRecognizers() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTouchCell))
        contentView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    public func configure(with model: Model) {
        
    }
    
    @objc func didTouchCell() {
        touched?()
    }
}
