//
//  FormatBuilder.swift
//  autosaveProject
//
//  Created by Asia Michelle Serrano on 6/20/24.
//

import Foundation
import Protocols

public typealias FormatBuilders = [FormatBuilder]

public enum FormatBuilder: Iterating, BuildingProtocol {
        
    public static var random: Self {
        Self.allCases.randomElement()!
    }
    
    public static var allCases: [Self] {
        var cases: [Self] = .init()
        
        cases.append(contentsOf: DigitalEnum.allCases.map(Self.digital))
        cases.append(contentsOf: PhysicalEnum.allCases.map(Self.physical))
        
        return cases
    }
    
    case digital(DigitalEnum)
    case physical(PhysicalEnum)
    
    public init(_ format: FormatEnum, _ id: String) {
        switch format {
        case .digital: 
            self = .digital(.init(id: id))
        case .physical: 
            self = .physical(.init(id: id))
        }
    }
    
    public init(_ property: Property) {
        let format: FormatEnum = .init(id: property.subcategory_id)
        let id: String = property.value_id
        self = .init(format, id)
    }
    
    private var value: Enumeratly {
        switch self {
        case .digital(let d): return d
        case .physical(let p): return p
        }
    }
    
    public var id: String {
        self.value.id
    }
    
    public var display: String {
        self.value.display
    }
    
    public var category: Property.Category {
        .format
    }
    
    public var subCategory: Property.SubCategory {
        switch self {
        case .digital(_): return .digital
        case .physical(_): return .physical
        }
    }
    
    public var formatEnum: FormatEnum {
        .init(id: self.subcategory_id)
    }
    
//    public var typeEnum: TypeEnum {
//        switch self {
//        case .digital(_): return .digital
//        case .physical(_): return .physical
//        }
//    }
//    
//    public var tagEnum: TagEnum {
//        .platform
//    }
//    
//    public var propertyEnum: PropertyEnum {
//        .format
//    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.formatEnum.id)
        hasher.combine(self.id)
    }
    
}
