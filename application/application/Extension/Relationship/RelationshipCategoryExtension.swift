//
//  RelationshipCategoryExtension.swift
//  application
//
//  Created by Asia Serrano on 8/1/24.
//

import Foundation
import Extensions

extension Relationship.Category : Hashable {
    
    public static func == (lhs: Relationship.Category, rhs: Relationship.Category) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.main)
        hasher.combine(self.sub)
    }
    
}

public extension Relationship.Category {
    
    static func random(_ cat: Property.Category = .random) -> Relationship.Category {
        switch cat {
        case .mode:
            return .mode(.random)
        case .platform:
            return .platform(.random, .random)
        default:
            return .input(.random)
        }
    }
    
    var main: Property.Builder {
        switch self {
        case .input(let i): return .input(i)
        case .mode(let m): return .mode(m)
        case .platform(let p, _): return .platform(p)
        }
    }
    
    var sub: Property.Builder {
        switch self {
        case .input(let i): return .input(i)
        case .mode(let m): return .mode(m)
        case .platform(_, let f): return .format(f)
        }
    }
    
    var property: Property.Category {
        self.main.category
    }
    
}
