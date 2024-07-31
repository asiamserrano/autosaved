//
//  XboxEnum.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import Protocols

public enum XboxEnum: Enumerating, PlatformProtocol {
    
    case xbox, x360, one
    
    public var display: String {
        var end: String {
            switch self {
            case .xbox: return .empty
            case .x360: return "360"
            case .one: return "One"
            }
        }
        
        return "\(self.platformEnum.display) \(end)".trimmed
    }
    
    public var platformEnum: PlatformEnum { .xbox }
    
    public var digitalEnums: DigitalEnums? {
        switch self {
        case .x360, .one:
            return [ .file, .xbox ]
        default:
            return nil
        }
    }
    
    public var physicalEnum: PhysicalEnum {
        .disc
    }
    
 }
