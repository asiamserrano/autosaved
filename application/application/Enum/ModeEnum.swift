//
//  ModeEnum.swift
//  autosaveProject
//
//  Created by Asia Michelle Serrano on 6/20/24.
//

import Foundation
import Protocols

public typealias ModeEnums = [ModeEnum]

public enum ModeEnum: Enumerating, BuildingProtocol {
        
    case single, coop, multi
    
    public init(_ property: Property) {
        self = .init(id: property.value_id)
    }
    
    public var display: String {
        switch self {
        case .single: return "Single-Player"
        case .coop: return "Two-Player"
        case .multi: return "Multiplayer"
        }
    }
    
    public var icon: String {
        switch self {
        case .single: return "person.fill"
        case .coop: return "person.2.fill"
        case .multi: return "person.3.fill"
        }
    }
    
    public var category: Property.Category { .mode }
    public var subCategory: Property.SubCategory { .mode }
    
}
