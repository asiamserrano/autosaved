//
//  BuildingProtocol.swift
//  sanfrancisco
//
//  Created by Asia Serrano on 7/19/24.
//

import Foundation
import Protocols

public protocol BuildingProtocol: PropertyProtocol, Displaying {
        
//    var typeEnum: TypeEnum { get }
//    var tagEnum: TagEnum { get }
//    var propertyEnum: PropertyEnum { get }
    
    var category: Property.Category { get }
    var subCategory: Property.SubCategory { get }
    
    init(_ property: Property)
    
}

public extension BuildingProtocol {
    
    var value_id: String { self.id }
    var value_display: String { self.display }
    var category_id: String { self.category.id }
    var subcategory_id: String { self.subCategory.id }
    
}


//public extension BuildingProtocol {
//    
//    static func < (lhs: Self, rhs: Self) -> Bool {
//        if lhs.typeEnum == rhs.typeEnum {
//            return lhs.id < rhs.id
//        } else {
//            return lhs.typeEnum < rhs.typeEnum
//        }
//    }
//
//}
