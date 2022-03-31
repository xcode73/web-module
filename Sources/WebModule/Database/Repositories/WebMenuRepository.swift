//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 03. 03..
//

import Vapor
import Fluent
import Feather

struct WebMenuRepository: FeatherModelRepository {
    typealias DatabaseModel = WebMenuModel

    public private(set) var db: Database
    
    init(_ db: Database) {
        self.db = db
    }
}
