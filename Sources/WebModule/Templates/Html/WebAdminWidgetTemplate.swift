//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 06..
//

import Vapor
import Feather
import SwiftHtml
import FeatherIcons
import WebApi

struct WebAdminWidgetTemplate: TemplateRepresentable {
 
    @TagBuilder
    func render(_ req: Request) -> Tag {
        Svg.compass

        H2("Web")
        Ul {
            if req.checkPermission(Web.permission(for: .detail)) {
                Li {
                    A("Settings")
                        .href("/admin/web/settings")
                }
            }
            if req.checkPermission(Web.Page.permission(for: .list)) {
                Li {
                    A("Pages")
                        .href("/admin/web/pages")
                }
            }
            if req.checkPermission(Web.Menu.permission(for: .list)) {
                Li {
                    A("Menus")
                        .href("/admin/web/menus")
                }
            }
        }
    }
}
