//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 18..
//

import WebObjects

public struct WebPageContext {
    public var page: Web.Page.Detail
    
    public init(page: Web.Page.Detail) {
        self.page = page
    }
}
