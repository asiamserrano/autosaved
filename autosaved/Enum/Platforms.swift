//
//  Platforms.swift
//  autosaved
//
//  Created by Asia Serrano on 6/18/23.
//

import Foundation

public enum Platforms: EnumProtocol {
    
    public enum PlayStation: EnumProtocol {
        
        case PS1, PS2, PS3, PS4, PS5, PSP
        
        public var value: String {
            
            var end: String {
                if let ch: Character = self.id.last, let i: Int = Int(String(ch)) {
                    return i == 1 ? .empty : i.description
                } else { return "Portable" }
            }
            
            return "PlayStation \(end)".trimmed
        }
        
        public var classification: Classification {
            switch self {
            case .PSP: return .handheld
            default: return .console
            }
        }
        
    }

    public enum Xbox: EnumProtocol {
        
        case XBOX, XBOX360, XBOXONE
        
        public var value: String {
            var end: String {
                switch self {
                case .XBOX: return .empty
                case .XBOX360: return "360"
                case .XBOXONE: return "One"
                }
            }
            
            return "Xbox \(end)".trimmed
        }
        
        public var classification: Classification { .console }
        
    }

    public enum Nintendo: EnumProtocol {
        
        case SNES, SWITCH, WII, WIIU, GAMECUBE, N3DS
        
        public var value: String {
            switch self {
            case .SNES: return "Super Nintendo Entertainment System"
            case .SWITCH: return "Nintendo Switch"
            case .WII: return "Wii"
            case .WIIU : return "Wii U"
            case .GAMECUBE: return "GameCube"
            case .N3DS: return "Nintendo 3DS"
            }
        }
        
        public var classification: Classification {
            switch self {
            case .SWITCH, .WIIU: return .hybrid
            case .N3DS: return .handheld
            default: return .console
            }
        }
        
    }

    public enum PC: EnumProtocol {
        
        case WINDOWS, MAC
        
        public var value: String {
            switch self {
            case .WINDOWS: return "Microsoft Windows"
            case .MAC: return "Apple macOS"
            }
        }
        
        public var classification: Classification { .os }
        
    }
    
    public enum Classification: EnumProtocol {
        case handheld
        case console
        case hybrid
        case os
        
        public var value: String {
            switch self {
            case .os: return "Operating System"
            default: return Self.defaultValue(self)
            }
        }
        
    }
    
    case playstation(PlayStation)
    case xbox(Xbox)
    case nintendo(Nintendo)
    case pc(PC)


    public static var allCases: [Platforms] {
        PlayStation.allCases.map(Self.playstation) +
        Xbox.allCases.map(Self.xbox) +
        Nintendo.allCases.map(Self.nintendo) +
        PC.allCases.map(Self.pc)
    }
    
    public var value: String {
        switch self {
        case .playstation(let p): return p.value
        case .xbox(let x): return x.value
        case .nintendo(let n): return n.value
        case .pc(let pc): return pc.value
        }
    }
    
    public var classification: Classification {
        switch self {
        case .playstation(let p): return p.classification
        case .xbox(let x): return x.classification
        case .nintendo(let n): return n.classification
        case .pc(let pc): return pc.classification
        }
    }
    
    public var toString: String {
        "\(self.value) (\(self.classification.value))"
    }

}
