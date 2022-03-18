//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 11. 24..
//

import Vapor
import Feather
import FeatherObjects
import WebObjects


struct WebRouter: FeatherRouter {
    
    let pageAdminController = WebPageAdminController()
    let pageApiController = WebPageApiController()
    let menuAdminController = WebMenuAdminController()
    let menuApiController = WebMenuApiController()
    let menuItemAdminController = WebMenuItemAdminController()
    let menuItemApiController = WebMenuItemApiController()
    let settingsController = WebSettingsAdminController()
    let responseController = WebResponseController()
    
    func boot(_ app: Application) throws {
        app.routes.get(app.feather.config.paths.sitemap.pathComponent, use: responseController.renderSitemapTemplate)
        app.routes.get(app.feather.config.paths.rss.pathComponent, use: responseController.renderRssTemplate)
        app.routes.get(app.feather.config.paths.robots.pathComponent, use: responseController.renderRobotsTemplate)
    }

    func adminRoutesHook(args: HookArguments) {
        pageAdminController.setUpRoutes(args.routes)
        menuAdminController.setUpRoutes(args.routes)
        menuItemAdminController.setUpRoutes(args.routes)

        args.routes.group(Web.pathKey.pathComponent) { routes in
            routes.get("settings", use: settingsController.settingsView)
            routes.post("settings", use: settingsController.settings)
        }
        
        args.routes.get(Web.pathKey.pathComponent) { req -> Response in
            let tag = WebAdminWidgetTemplate().render(req)
            let template = SystemAdminModulePageTemplate(.init(title: "Web", tag: tag))
            return req.templates.renderHtml(template)
        }
    }

    func apiRoutesHook(args: HookArguments) {
        pageApiController.setUpRoutes(args.routes)
        menuApiController.setUpRoutes(args.routes)
        menuItemApiController.setUpRoutes(args.routes)
    }
}
