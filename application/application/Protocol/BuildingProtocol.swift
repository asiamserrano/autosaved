//
//  BuildingProtocol.swift
//  sanfrancisco
//
//  Created by Asia Serrano on 7/19/24.
//

import Foundation
import Protocols

public protocol BuildingProtocol: PropertyProtocol {

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
