//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 23..
//

import Feather

@_cdecl("createWebModule")
public func createWebModule() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(WebBuilder()).toOpaque()
}

public final class WebBuilder: FeatherModuleBuilder {

    public override func build() -> FeatherModule {
        WebModule()
    }
}
