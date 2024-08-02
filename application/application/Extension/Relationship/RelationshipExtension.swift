//
//  RelationshipExtension.swift
//  application
//
//  Created by Asia Serrano on 8/1/24.
//

import Foundation
import Protocols

public extension Relationship {
    
    var properties: (main: UUID, sub: UUID) {
        (self.main_property_uuid, self.sub_property_uuid)
    }
    
}
