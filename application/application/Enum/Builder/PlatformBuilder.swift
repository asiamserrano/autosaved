//
//  PlatformBuilder.swift
//  autosaveProject
//
//  Created by Asia Michelle Serrano on 6/20/24.
//

import Foundation
import Protocols

public typealias PlatformBuilders = [PlatformBuilder]

public enum PlatformBuilder: Iterating, BuildingProtocol, PlatformProtocol {
        
    public static var random: Self {
        Self.allCases.randomElement()!
    }
    
    public static var allCases: [Self] {
        var cases: [Self] = .init()
        
        cases.append(contentsOf: PlayStationEnum.allCases.map(Self.playstation))
        cases.append(contentsOf: NintendoEnum.allCases.map(Self.nintendo))
        cases.append(contentsOf: OSEnum.allCases.map(Self.os))
        cases.append(contentsOf: XboxEnum.allCases.map(Self.xbox))
        
        return cases
    }
    
    case playstation(PlayStationEnum)
    case nintendo(NintendoEnum)
    case os(OSEnum)
    case xbox(XboxEnum)
    
    public init(_ platform: PlatformEnum, _ id: String) {
        switch platform {
        case .playstation: 
            self = .playstation(.init(id: id))
        case .xbox: 
            self = .xbox(.init(id: id))
        case .os: 
            self = .os(.init(id: id))
        case .nintendo: 
            self = .nintendo(.init(id: id))
        }
    }
    
    public init(_ property: Property) {
        let platform: PlatformEnum = .init(id: property.subcategory_id)
        let id: String = property.value_id
        self = .init(platform, id)
    }
    
    private var value: any PlatformProtocol {
        switch self {
        case .nintendo(let n): return n
        case .os(let o): return o
        case .playstation(let p): return p
        case .xbox(let x): return x
        }
    }
    
    public var id: String {
        self.value.id
    }
    
    public var display: String {
        self.value.display
    }
    
    public var category: Property.Category {
        .platform
    }
    
    public var subCategory: Property.SubCategory {
        self.value.subCategory
    }
    
    public var platformEnum: PlatformEnum {
        self.value.platformEnum
    }
    
    public var digitalEnums: DigitalEnums? {
        self.value.digitalEnums
    }
    
    public var physicalEnum: PhysicalEnum {
        self.value.physicalEnum
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.platformEnum.id)
        hasher.combine(self.id)
    }
    
}
