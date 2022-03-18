//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 23..
//

import FeatherObjects

public struct WebSitemapContext {

    public let items: [FeatherMetadata.List]
    
    public init(items: [FeatherMetadata.List]) {
        self.items = items
    }
}

