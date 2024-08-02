//
//  PropertyExtension.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import Protocols

public extension Property {
    
    var category: Property.Category {
        .init(id: self.category_id)
    }
    
    var subCategory: Property.SubCategory {
        .init(id: self.subcategory_id)
    }
    
}
