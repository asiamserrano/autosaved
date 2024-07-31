//
//  PlatformEnum.swift
//  cancun
//
//  Created by Asia Serrano on 6/29/24.
//

import Foundation
import Protocols

public typealias PlatformEnums = [PlatformEnum]

public enum PlatformEnum: Enumerating {
    case playstation
    case nintendo
    case os
    case xbox
    
    public var display: String {
        switch self {
        case .os: return "Operating System"
        case .playstation: return "PlayStation"
        default: return self.id.capitalized
        }
    }
    
}


