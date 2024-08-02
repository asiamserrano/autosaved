//
//  Property.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import SwiftData
import Protocols
import SwiftUI

public typealias Properties = [Property]

@Model
public class Property {
    
    public typealias Wrappers = [Wrapper]
    
    public let uuid: UUID
    
    public private (set) var value_id: String
    public private (set) var value_display: String
    public private (set) var category_id: String
    public private (set) var subcategory_id: String
    
    private init() {
        self.uuid = .init()
        self.value_id = .empty
        self.value_display = .empty
        self.category_id = .empty
        self.subcategory_id = .empty
    }
    
    public init(_ builder: any BuildingProtocol) {
        self.uuid = .init()
        self.value_id = builder.value_id
        self.value_display = builder.value_display
        self.category_id = builder.category_id
        self.subcategory_id = builder.subcategory_id
    }
    
    public enum Category: Enumerating {
        case input
        case mode
        case format
        case platform
    }
    
    public enum SubCategory: Enumerating {
        case series
        case developer
        case publisher
        case genre
        case mode
        case physical
        case digital
        case playstation
        case nintendo
        case os
        case xbox
    }
    
    public class Wrapper {
        
        @Published public var value: String
        @Published public var editMode: EditMode
        
        public let property: Property
        
        public init(_ property: Property) {
            self.value = property.value_display
            self.editMode = .inactive
            self.property = property
        }
        
    }
    
    public enum Builder {
        case input(InputBuilder)
        case mode(ModeEnum)
        case format(FormatBuilder)
        case platform(PlatformBuilder)
    }
    
}
