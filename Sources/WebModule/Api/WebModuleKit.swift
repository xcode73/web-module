//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 23..
//

import Vapor
import Fluent
import Feather

public extension HookName {
    static let installWebPages: HookName = "install-web-pages"
    static let installWebMenuItems: HookName = "install-web-menu-items"

    /// return a HeaderContext.Action item to display an action next to the menu
//    static let webAction: HookName = "web-action"
    
    /// reuturn a module name and provide the web assets under that module location `/img/[module]/...`
//    static let webAssets: HookName = "web-assets"
    
//    static let webCss: HookName = "web-css"
//    static let webJs: HookName = "web-js"
}

public struct WebApi {
    private var db: Database
    
    public var menu: WebMenuApi { .init(.init(db)) }
    public var menuItem: WebMenuItemApi { .init(.init(db)) }
    public var page: WebPageApi { .init(.init(db)) }

    init(_ db: Database) {
        self.db = db
    }
}

public extension Request {

    var web: WebApi { .init(db) }
}

