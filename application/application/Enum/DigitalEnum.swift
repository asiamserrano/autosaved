//
//  DigitalEnum.swift
//  autosaveProject
//
//  Created by Asia Michelle Serrano on 6/20/24.
//

import Foundation
import Protocols

public typealias DigitalEnums = [DigitalEnum]

public enum DigitalEnum: Enumerating {
    
    case steam, origin, psn, xbox, nintendo, file
    
    public var display: String {
        switch self {
        case .psn: return "PlayStation Network"
        case .xbox: return "Xbox Live"
        case .nintendo: return "Nintendo eShop"
        case .file: return "System File"
        case .origin: return "Origin"
        case .steam: return "Steam"
        }
    }
    
    public var format: FormatEnum { .digital }
    
}
