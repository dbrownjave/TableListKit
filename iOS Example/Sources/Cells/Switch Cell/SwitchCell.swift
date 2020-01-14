//
//  SwitchCell.swift
//  TableView-Date-Sections-Demo
//
//  Created by Dorian Javaughn Brown on 12/18/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//

import UIKit
import TableListKit

class SwitchCell: TableCell<SwitchCellModel> {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = UIColor.secondarySystemBackground
    }
}
