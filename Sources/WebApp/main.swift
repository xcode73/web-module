//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 23..
//

import Vapor
import Fluent
import FluentSQLiteDriver
import Liquid
import LiquidLocalDriver
import Feather
import WebModule

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
