//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 23..
//

@_exported import FeatherRestKit

import Feather

import FluentSQLiteDriver
import LiquidLocalDriver

import WebModule

/// https://github.com/vapor/fluent/blob/main/Sources/Fluent/Exports.swift
infix operator ~~
infix operator =~
infix operator !~
infix operator !=~
infix operator !~=

public func configure(_ app: Application) throws {
    app.feather.boot()

    app.databases.use(.sqlite(.file(app.feather.paths.resources.path + "/db.sqlite")), as: .sqlite)
    
    app.fileStorages.use(.local(publicUrl: app.feather.baseUrl,
                                publicPath: app.feather.paths.public.path,
                                workDirectory: Feather.Directories.assets), as: .local)

    try app.feather.start([
        WebBuilder().build(),
    ])
}

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
defer { app.shutdown() }
try configure(app)
try app.run()
