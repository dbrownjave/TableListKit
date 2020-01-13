//
//  ViewController.swift
//  iOS Example
//
//  Created by Jave on Jan 12, 2020.
//  Copyright © 2020 Magical X Labs. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    var emojiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "📦"
        label.font = UIFont.systemFont(ofSize: 74.0)
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18.0)
        return label
    }()
    
    let transaction: Transaction
    
    
    init(transaction: Transaction) {
        self.transaction = transaction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
    }
    
    private func setupUI() {
        view.addSubview(dateLabel)
        dateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateLabel.text = transaction.date.format()
    }
    
}

