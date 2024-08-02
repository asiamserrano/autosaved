//
//  Relationship.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import SwiftData

public typealias Relationships = [Relationship]

@Model
public class Relationship {
    
    public typealias Builders = [Builder]
    
    public let game_uuid: UUID
    public let main_property_uuid: UUID
    public let sub_property_uuid: UUID
        
    public init(_ game: Game, _ main: Property, _ sub: Property) {
        self.game_uuid = game.uuid
        self.main_property_uuid = main.uuid
        self.sub_property_uuid = sub.uuid
    }
    
    public enum Category {
        case input(InputBuilder)
        case mode(ModeEnum)
        case platform(PlatformBuilder, FormatBuilder)
    }
    
    public struct Builder {
        let game: Game.Builder
        let category: Category
        
        public init(_ game: Game.Builder, _ category: Category) {
            self.game = game
            self.category = category
        }
        
    }
    
}
