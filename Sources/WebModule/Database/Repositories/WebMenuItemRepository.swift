//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 03. 03..
//


struct WebMenuItemRepository: FeatherModelRepository {
    typealias DatabaseModel = WebMenuItemModel

    public private(set) var req: Request
    
    init(_ req: Request) {
        self.req = req
    }
}
