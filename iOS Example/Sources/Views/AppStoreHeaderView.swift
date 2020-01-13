//
//  AppStoreHeaderView.swift
//  iOS Example
//
//  Created by Dorian Javaughn Brown on 1/12/20.
//  Copyright © 2020 Magical X Labs. All rights reserved.
//

import UIKit

class AppStoreHeaderView: UIView {
    
    let iconIV: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "appstore-icon")
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addHeaderView()
        backgroundColor = #colorLiteral(red: 0.6048533916, green: 0.9066538215, blue: 0.9645020366, alpha: 0.6002415459)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addHeaderView() {
        addSubview(iconIV)
        iconIV.heightAnchor.constraint(equalToConstant: 80).isActive = true
        iconIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconIV.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
