//
//  NintendoEnum.swift
//  autosaveProject
//
//  Created by Asia Michelle Serrano on 6/20/24.
//

import Foundation
import Protocols

public enum NintendoEnum: Enumerating, PlatformProtocol {
    
    case snes, `switch`, wii, wiiu, gamecube, n3ds
    
    public var display: String {
        let name: String = self.platformEnum.display
        switch self {
        case .snes: return "Super \(name) Entertainment System"
        case .switch: return "\(name) Switch"
        case .wii: return "Wii"
        case .wiiu : return "Wii U"
        case .gamecube: return "GameCube"
        case .n3ds: return "\(name) 3DS"
        }
    }

    public var platformEnum: PlatformEnum { .nintendo }
    
    public var digitalEnums: DigitalEnums? {
        switch self {
        case .switch:
            return [ .nintendo ]
        default:
            return nil
        }
    }
    
    public var physicalEnum: PhysicalEnum {
        switch self {
        case .snes:
            return .cartridge
        case .switch, .n3ds:
            return .card
        default:
            return .disc
    
        }
    }
    
}
