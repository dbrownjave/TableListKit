//
//  NibView.swift
//  Wallit
//
//  Created by Dorian Javaughn Brown on 12/16/19.
//  Copyright © 2019 Magical X Labs. All rights reserved.
//

import UIKit

extension NibView {

    /// Initializes the view from a xib
    /// file and configure initial constrains.
    func xibSetup() {
        backgroundColor = .clear
        let view = loadViewFromNib()
        addEdgeConstrainedSubView(view: view)
    }

    /// Loads a view from it's xib file.
    ///
    /// - Returns: an instantiated view from the Nib file of the same class name.
    fileprivate func loadViewFromNib<T: UIView>() -> T {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("""
                Cannot instantiate a UIView from the nib for class \(type(of: self)).
                Please ensure that the nib file is named \(type(of: self))
                """)
        }
        return view
    }
}


extension UITableViewCell: NibView {}
extension UICollectionViewCell: NibView {}
