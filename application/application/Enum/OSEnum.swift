//
//  OSEnum.swift
//  autosaveProject
//
//  Created by Asia Michelle Serrano on 6/20/24.
//

import Foundation
import Protocols

public enum OSEnum: Enumerating, PlatformProtocol {
    
    case win, mac
    
    public var display: String {
        switch self {
        case .win: return "Microsoft Windows"
        case .mac: return "Apple macOS"
        }
    }
    
    public var platformEnum: PlatformEnum { .os }
    
    public var digitalEnums: DigitalEnums? {
        [ .steam, .origin, .file ]
    }
    
    public var physicalEnum: PhysicalEnum {
        .disc
    }

}
