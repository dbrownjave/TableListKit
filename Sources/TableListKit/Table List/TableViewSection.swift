//
//  TableViewSection.swift
//  CreditPal
//
//  Created by Dorian Javaughn Brown on 11/27/19.
//  Copyright © 2019 Dorian Javaughn Brown. All rights reserved.
//

import UIKit

public enum TableSectionHeaderType {
    case none
    case custom
    case standard
}

public enum TableSectionFooterType {
    case none
    case custom
    case standard
}

public protocol TableSectionItem {
    var id: Int? { get set }
    var dataSource: UITableViewDataSource { get set }
    var numberOfItemsInSection: Int { get set }
    
    
    var headerType: TableSectionHeaderType { get set }
    var headerTitle: String? { get set }
    var headerView: UIView? { get set }
    
    var footerType: TableSectionFooterType { get set }
    var footerTitle: String? { get set }
    var footerView: UIView? { get set }
}

public protocol TableViewSectionItem {
    associatedtype Model
    associatedtype Cell: UITableViewCell
    
    var dataSource: TableViewDataSource<Model, Cell> { get }
    var id: Int? { get set}
}

public struct TableViewSection<Model, Cell: UITableViewCell>: TableViewSectionItem {
    public let dataSource: TableViewDataSource<Model, Cell>
    let section: TableSection<Model, Cell>
    let models: [Model] = []
    public var id: Int?

    public init(dataSource: TableViewDataSource<Model, Cell>, models: [Model]) {
        self.dataSource = dataSource
        self.section = TableSection<Model, Cell>(dataSource: dataSource, models: models)
    }
}


public struct TableSection<Model, Cell: UITableViewCell>: TableSectionItem {
    public var id: Int?
    public var numberOfItemsInSection: Int = 0
    public var dataSource: UITableViewDataSource
    var models: [Model] {
        didSet {
            numberOfItemsInSection = models.count
        }
    }
    
    // Header
    public var headerType: TableSectionHeaderType = .none
    public var headerTitle: String?
    public var headerView: UIView?
    
    // Footer
    public var footerType: TableSectionFooterType = .none
    public var footerTitle: String?
    public var footerView: UIView?

    public init(dataSource: UITableViewDataSource,
         models: [Model],
         headerType: TableSectionHeaderType = .none,
         headerTitle: String? = nil,
         headerView: UIView? = nil,
         footerType: TableSectionFooterType = .none,
         footerTitle: String? = nil,
         footerView: UIView? = nil
         ) {
        
        self.dataSource = dataSource
        self.models = models
        self.numberOfItemsInSection = models.count
        
        // header
        self.headerType = headerType
        self.headerTitle = headerTitle
        self.headerView = headerView
        
        // footer
        self.footerType = footerType
        self.footerTitle = footerTitle
        self.footerView = footerView
        
    }
    
    // MARK: - TODO: Type Safty
//    private mutating func setupHeader() {
//        // header
//        self.headerType = headerType
//
//        switch headerType {
//        case .none:
//            self.headerTitle = headerTitle
//            self.headerView = headerView
//        case .custom:
//            self.headerTitle = headerTitle
//            self.headerView = headerView
//        case .standard
//            self.headerTitle = headerTitle
//            self.headerView = headerView
//        }
//
//
//        self.headerTitle = headerTitle
//        self.headerView = headerView
//    }
//
//    private func setupFooter() {
//
//    }
    
    
}

public struct TableSections {
    var sections: [TableSectionItem]
    var dataSources: [UITableViewDataSource]
    var total: Int
    
    init(sections: [TableSectionItem], dataSources: [UITableViewDataSource]) {
        self.sections = sections
        self.total = sections.count
        self.dataSources = dataSources
    }
}


// sruct -> TableViewSection
// models<T>
// index
// total
// cell: Type
