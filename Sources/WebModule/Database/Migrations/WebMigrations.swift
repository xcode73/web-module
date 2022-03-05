//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 11. 24..
//

import Fluent

struct WebMigrations {

    struct v1: AsyncMigration {

        func prepare(on db: Database) async throws {
            try await db.schema(WebPageModel.schema)
                .id()
                .field(WebPageModel.FieldKeys.v1.title, .string, .required)
                .field(WebPageModel.FieldKeys.v1.content, .string)
                .create()
            
            try await db.schema(WebMenuModel.schema)
                .id()
                .field(WebMenuModel.FieldKeys.v1.key, .string, .required)
                .field(WebMenuModel.FieldKeys.v1.name, .string, .required)
                .field(WebMenuModel.FieldKeys.v1.notes, .string)
                .unique(on: WebMenuModel.FieldKeys.v1.key)
                .create()
            
            try await db.schema(WebMenuItemModel.schema)
                .id()
                .field(WebMenuItemModel.FieldKeys.v1.label, .string, .required)
                .field(WebMenuItemModel.FieldKeys.v1.url, .string, .required)
                .field(WebMenuItemModel.FieldKeys.v1.priority, .int, .required)
                .field(WebMenuItemModel.FieldKeys.v1.isBlank, .bool, .required)
                .field(WebMenuItemModel.FieldKeys.v1.menuId, .uuid, .required)
                .field(WebMenuItemModel.FieldKeys.v1.permission, .string)
                .foreignKey(WebMenuItemModel.FieldKeys.v1.menuId, references: WebMenuModel.schema, .id, onDelete: .cascade)
                .create()
        }

        func revert(on db: Database) async throws {
            try await db.schema(WebMenuItemModel.schema).delete()
            try await db.schema(WebMenuModel.schema).delete()
            try await db.schema(WebPageModel.schema).delete()
        }
    }
}
