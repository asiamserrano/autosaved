//
//  PlayStationEnum.swift
//  autosaveProject
//
//  Created by Asia Michelle Serrano on 6/20/24.
//

import Foundation
import Protocols

public enum PlayStationEnum: Enumerating, PlatformProtocol {
    
    case ps1, ps2, ps3, ps4, ps5, psp
    
    public var display: String {
        
        var end: String {
            if let ch: Character = self.id.last, let i: Int = Int(String(ch)) {
                return i == 1 ? .empty : i.description
            } else { return "Portable" }
        }
        
        return "\(self.platformEnum.display) \(end)".trimmed
    }
    
    public var platformEnum: PlatformEnum { .playstation }
    
    public var digitalEnums: DigitalEnums? {
        switch self {
        case .ps3, .ps4, .ps5:
            return [ .file, .psn ]
        case .psp:
            return [ .file ]
        default:
            return nil
        }
    }
    
    public var physicalEnum: PhysicalEnum {
        .disc
    }
    
}

