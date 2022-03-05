//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 11. 24..
//

import Vapor
import Feather
import WebApi

struct WebRouter: FeatherRouter {
    
    let pageAdminController = WebPageAdminController()
    let pageApiController = WebPageApiController()
    let menuAdminController = WebMenuAdminController()
    let menuApiController = WebMenuApiController()
    let menuItemAdminController = WebMenuItemAdminController()
    let menuItemApiController = WebMenuItemApiController()
    
    func adminRoutesHook(args: HookArguments) {
        pageAdminController.setUpRoutes(args.routes)
        menuAdminController.setUpRoutes(args.routes)
        menuItemAdminController.setUpRoutes(args.routes)

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
