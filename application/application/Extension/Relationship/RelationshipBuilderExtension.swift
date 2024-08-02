//
//  RelationshipBuilderExtension.swift
//  application
//
//  Created by Asia Serrano on 8/1/24.
//

import Foundation
import Extensions

extension Relationship.Builder: Hashable {
    
    public static func == (lhs: Relationship.Builder, rhs: Relationship.Builder) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.game)
        hasher.combine(self.category)
    }
    
}

extension Relationship.Builder: Comparable {
    
    public static func < (lhs: Relationship.Builder, rhs: Relationship.Builder) -> Bool {
        if lhs.property == rhs.property {
            if lhs.property == .platform {
                if lhs.main == rhs.main {
                    return lhs.sub < rhs.sub
                } else {
                    return lhs.main < rhs.main
                }
            } else {
                return lhs.main < rhs.main
            }
        } else {
            return lhs.property < rhs.property
        }
    }
    
    private var property: Property.Category {
        self.category.property
    }
    
    private var main: Property.Builder {
        self.category.main
    }
    
    private var sub: Property.Builder {
        self.category.sub
    }
    
}

public extension Relationship.Builder {
    
    static func random(_ game: Game.Builder, _ cat: Property.Category = .random) -> Relationship.Builder {
        .init(game, .random(cat))
    }
    
}
