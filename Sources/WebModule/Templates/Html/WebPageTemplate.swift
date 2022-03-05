//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 18..
//

import Vapor
import Feather
import SwiftHtml

final class WebPageTemplate: AbstractTemplate<WebPageContext> {

    override func render(_ req: Request) -> Tag {
        req.templateEngine.system.index(.init(title: context.page.title)) {
            Wrapper {
                Container {
                    H1(context.page.title)
                    Text(context.page.content)
                }
                .class(add: "\(context.page.metadata.slug)-page", !context.page.metadata.slug.isEmpty)
            }
            .id("web-page")
        }
        .render(req)
    }
}
