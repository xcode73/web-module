//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 03. 06..
//

import Vapor
import Feather
import Fluent

struct WebResponseController {

    func renderSitemapTemplate(_ req: Request) async throws -> Response {
        let metadatas = try await req.system.metadata.list()
        let template = WebSitemapTemplate(.init(items: metadatas))
        return req.templates.renderXml(template)
    }

    func renderRssTemplate(_ req: Request) async throws -> Response {
        let metadatas = try await req.system.metadata.listFeedItems()
        let template = WebRssTemplate(.init(items: metadatas))
        return req.templates.renderXml(template)
    }

    func renderRobotsTemplate(_ req: Request) async throws -> Response {
        let robots = """
            Sitemap: \(req.feather.publicUrl)\(req.feather.config.paths.sitemap.safePath())

            User-agent: *
            Disallow: \(req.feather.config.paths.admin.safePath())
            Disallow: \(req.feather.config.paths.api.safePath())
            """
        return Response(status: .ok,
                        headers: [
                            "content-type": "text/plain"
                        ],
                        body: .init(string: robots))
    }
}
