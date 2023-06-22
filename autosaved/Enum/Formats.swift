//
//  Formats.swift
//  autosaved
//
//  Created by Asia Serrano on 6/18/23.
//

import Foundation

public enum Formats: EnumProtocol {
    
    public enum Physical: EnumProtocol {
        case disc, cartridge
    }

    public enum Digital: EnumProtocol {
        case download
        case steam
        case origin
        case psn
        case xbox
        case nintendo
        
        public var value: String {
            switch self {
            case .psn: return "Playstation Network"
            case .xbox: return "Xbox Live"
            case .nintendo: return "Nintendo eShop"
            default: return Self.defaultValue(self)
            }
        }

    }
    
    case digital(Digital)
    case physical(Physical)
    
    public static var allCases: [Formats] {
        Digital.allCases.map(Self.digital) +
        Physical.allCases.map(Self.physical)
    }
    
    public var value: String {
        switch self {
        case .digital(let d): return d.value
        case .physical(let p): return p.value
        }
    }
    
    public var toString: String {
        var end: String {
            switch self {
            case .digital(_): return "Digital"
            case .physical(_): return "Physical"
            }
        }
        
        return "\(self.value) (\(end))"
    }
    
}

/*
 Internet requirement may be for a game itself (Genshin Impact, Fortnite, CODm)
 or in order to access the game (Steam, Origin)
 */
