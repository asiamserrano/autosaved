//
//  FormatEnum.swift
//  cancun
//
//  Created by Asia Serrano on 6/29/24.
//

import Foundation
import Protocols

public typealias FormatEnums = [FormatEnum]

public enum FormatEnum: Enumerating {
    case digital, physical
    
    public var icon: String {
        switch self {
        case .digital: return "arrow.down.circle.fill"
        case .physical: return "opticaldisc.fill"
        }
    }
    
}
