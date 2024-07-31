//
//  MenuEnum.swift
//  autosaveProject
//
//  Created by Asia Serrano on 6/24/24.
//

import Foundation
import Protocols

public enum MenuEnum: Enumerating {
    case library
    case wishlist
    case properties
    
    public var icon: String {
        switch self {
        case .properties: return "list.clipboard"
        case .wishlist: return "list.star"
        case .library: return "gamecontroller"
        }
    }
    
    public var statusEnum: StatusEnum {
        self == .library ? .library : .wishlist
    }
    
//    public var isLibrary: Bool {
//        switch self {
//        case .library: return true
//        default: return false
//        }
//    }
//    
//    public var isProperties: Bool {
//        switch self {
//        case .properties: return true
//        default: return false
//        }
//    }
    
}
