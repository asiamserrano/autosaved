//
//  StatusEnum.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import Protocols

public enum StatusEnum: Enumerating {
    case library
    case wishlist

    public var bool: Bool {
        switch self {
        case .library: return true
        case .wishlist: return false
        }
    }
    
    public init(_ bool: Bool) {
        self = Self.allCases.first(where: { $0.bool == bool })!
    }
    
}
