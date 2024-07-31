//
//  ContextExtension.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import SwiftData

public typealias Context = ModelContext

public extension Context {
    
    func save(_ wrapper: Game.Wrapper) -> Void {
        if let game: Game = wrapper.game {
            game.title_id = wrapper.title_id
            game.title_display = wrapper.title_display
            game.release_date = wrapper.release_date
            game.boxart_data = wrapper.boxart
            self.store()
        } else {
            let game: Game = .init(wrapper.title, wrapper.release, wrapper.status, wrapper.boxart)
            self.save(game)
        }
    }
    
}

private extension Context {
    
//    func remove(_ relationships: Relationships) -> Void {
//        relationships.forEach { relationship in
//            let properties: [UUID] = [relationship.properties.main, relationship.properties.sub]
//            self.remove(relationship)
//            properties.forEach { uuid in
//                if let property: Property = self.find(uuid), self.fetch(relationship: .property(property)).isEmpty {
//                    self.remove(property)
//                }
//            }
//        }
//    }
//    
//    func create(_ observer: Game.Observer) -> Void {
//        observer.tags.relationshipValues.forEach {
//            self.create(relationship: .init(detail: observer.detail, value: $0))
//        }
//    }
//
//    func find(_ detail: Game.Detail) -> Game? {
//        self.fetch(game: .detail(detail)).first
//    }
//    
//    func find(_ builder: Property.Builder) -> Property? {
//        self.fetch(property: .builder(builder)).first
//    }
//    
//    func find(_ uuid: UUID) -> Property? {
//        self.fetch(property: .uuid(uuid)).first
//    }
//    
//    func find(_ game: Game, _ main: Property, _ sub: Property) -> Relationship? {
//        self.fetch(relationship: .relationship(game, main, sub)).first
//    }
    
    func save(_ model: any PersistentModel) -> Void {
        self.insert(model)
        self.store()
    }
    
    func store() -> Void {
        try? self.save()
    }
    
}
