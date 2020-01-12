//
//  Date+Extensions.swift
//  TableView-Date-Sections-Demo
//
//  Created by Dorian Javaughn Brown on 11/15/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//
// references:
// https://spin.atomicobject.com/2017/07/28/swift-extending-date/

import Foundation

// Date  Extension

extension Date {
    func addDays(_ numDays: Int) -> Date {
        var components = DateComponents()
        components.day = numDays
        
        return Calendar.current.date(byAdding: components, to: self)!
    }
    
    func dateFormatTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy hh:mm:ss"
        return dateFormatter.string(from: self)
    }
    
    func format() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: self)
    }
}


// Date Protocol Extension
protocol Dated {
    var date: Date { get }
}

extension Array where Element: Dated {
    func groupedBy(dateComponents: Set<Calendar.Component>) -> [Date: [Element]] {
        let initial: [Date: [Element]] = [:]
        let groupedByDateComponents = reduce(into: initial) { acc, cur in
            let components = Calendar.current.dateComponents(dateComponents, from: cur.date)
            let date = Calendar.current.date(from: components)!
            let existing = acc[date] ?? []
            acc[date] = existing + [cur]
        }
        
        return groupedByDateComponents
    }
}
