//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 23..
//

import Vapor
import Feather
import SwiftHtml

final class WebSettingsPageTemplate: AbstractTemplate<WebSettingsContext> {
    
    override func render(_ req: Request) -> Tag {
        SystemAdminIndexTemplate(.init(title: "Settings", breadcrumbs: [
            LinkContext(label: "System", dropLast: 1),
        ])) {
            Wrapper {
                Container {
                    LeadTemplate(.init(title: "Settings")).render(req)
                    
                    FormTemplate(context.form).render(req)
                }
            }
        }
        .render(req)
    }
}


