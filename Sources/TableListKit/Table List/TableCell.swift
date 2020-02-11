//
//  TableCell.swift
//  CreditPal
//
//  Created by Dorian Javaughn Brown on 12/1/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//

import UIKit

open class TableCell<Model>: UITableViewCell, ConfigurableCell {
    open func configure(with model: Model) {}
    
    public var touched: (() -> ())?
    
    public var primaryLabel: String? {
        didSet {
            textLabel?.text = primaryLabel
        }
    }
    
    public var secondaryLabel: String? {
        didSet {
            detailTextLabel?.text = secondaryLabel
        }
    }
    
    public typealias DataType = Model
    
    func setupIU() {
         addGestureRecognizers()
    }

    private func addGestureRecognizers() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTouchCell))
        contentView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func didTouchCell() {
        touched?()
    }
}
