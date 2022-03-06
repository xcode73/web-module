//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 03. 06..
//

import Vapor
import Feather
import Fluent

extension WebManifestContext: Content {}

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
    
    func renderManifestFile(_ req: Request) async throws -> WebManifestContext {
        // @TODO: use web assets hook & proper name instead of hardcoded values
        WebManifestContext(shortName: "Feather",
                           name: "Feather CMS",
                           startUrl: "",
                           themeColor: "#fff",
                           backgroundColor: "#fff",
                           display: .standalone,
                           icons: getWebIcons() + [
                                .init(src: "/img/web/icons/mask.svg", sizes: "512x512", type: "image/svg+xml"),
                           ],
                           shortcuts: [])
    }
    
    private func getWebIcons() -> [WebManifestContext.Icon] {
        [57, 72, 76, 114, 120, 144, 152, 180, 192].map {
            .init(src: "/img/web/apple/icons/\($0).png", sizes: "\($0)x\($0)", type: "image/png")
        }
    }
}
