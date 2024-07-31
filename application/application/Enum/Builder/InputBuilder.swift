//
//  InputBuilder.swift
//  autosaveProject
//
//  Created by Asia Michelle Serrano on 6/20/24.
//

import Foundation
import Protocols

public typealias InputBuilders = [InputBuilder]

public enum InputBuilder: BuildingProtocol {
        
    public static func random(_ input: InputEnum) -> Self {
        switch input {
        case .series: return .series(.random)
        case .developer: return .developer(.random)
        case .publisher: return .publisher(.random)
        case .genre: return .genre(.random)
        }
    }
    
    public static var random: Self {
        .random(.random)
    }

    case series(String)
    case developer(String)
    case publisher(String)
    case genre(String)
    
    public init(_ input: InputEnum, _ value: String) {
        switch input {
        case .series:
            self = .series(value)
        case .developer:
            self = .developer(value)
        case .publisher:
            self = .publisher(value)
        case .genre:
            self = .genre(value)
        }
    }
    
    public init(_ property: Property) {
        let input: InputEnum = .init(id: property.subcategory_id)
        let value: String = property.value_display
        self = .init(input, value)
    }
    
    private var value: String {
        switch self {
        case .series(let string): return string
        case .developer(let string): return string
        case .publisher(let string): return string
        case .genre(let string): return string
        }
    }
    
    public var id: String {
        self.value.canonicalized
    }
    
    public var display: String {
        self.value.trimmed
    }
    
    public var inputEnum: InputEnum {
        switch self {
        case .series(_): return .series
        case .developer(_): return .developer
        case .publisher(_): return .publisher
        case .genre(_): return .genre
        }
    }
    
    public var category: Property.Category {
        .input
    }
    
    public var subCategory: Property.SubCategory {
        switch self.inputEnum {
        case .series: return .series
        case .developer: return .developer
        case .publisher: return .publisher
        case .genre: return .genre
        }
    }
    
//    public var typeEnum: TypeEnum {
//        self.inputEnum.typeEnum
//    }
//    
//    public var tagEnum: TagEnum {
//        self.inputEnum.tagEnum
//    }
//    
//    public var propertyEnum: PropertyEnum {
//        .input
//    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.inputEnum.id)
        hasher.combine(self.display)
    }
    
}
