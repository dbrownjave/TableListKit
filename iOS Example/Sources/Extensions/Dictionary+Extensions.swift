//
//  Date+Extensions.swift
//  TableView-Date-Sections-Demo
//
//  Created by Dorian Javaughn Brown on 11/15/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//
// references:

import Foundation

// Dictionary  Extension

extension Dictionary where Value:Comparable {
    var sortedByValue:[(Key,Value)] {return Array(self).sorted{$0.1 < $1.1}}
}

extension Dictionary where Key:Comparable {
    var sortedByKey:[(Key,Value)] {return Array(self).sorted{$0.0 < $1.0}}
}
