//
//  PlatformProtocol.swift
//  sanfrancisco
//
//  Created by Asia Serrano on 7/20/24.
//

import Foundation
import Protocols

public protocol PlatformProtocol: Displaying {
    var platformEnum: PlatformEnum { get }
    var digitalEnums: DigitalEnums? { get }
    var physicalEnum: PhysicalEnum { get }
}

public extension PlatformProtocol {
    
    var formatBuilders: FormatBuilders {
        
        let physical: FormatBuilders = [ .physical(self.physicalEnum) ]
        
        if let digitals: DigitalEnums = self.digitalEnums {
            return digitals.map { .digital($0) } + physical
        } else {
            return physical
        }
        
    }
    
    var subCategory: Property.SubCategory {
        switch self.platformEnum {
        case .playstation: return .playstation
        case .nintendo: return .nintendo
        case .os: return .os
        case .xbox: return .xbox
        }
    }
    
}
