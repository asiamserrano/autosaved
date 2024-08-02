//
//  PropertyBuilderExtension.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import Protocols

extension Property.Builder: Comparable {
    
    public static func < (lhs: Property.Builder, rhs: Property.Builder) -> Bool {
        if lhs.category == rhs.category {
            if lhs.subCategory == rhs.subCategory {
                return lhs.value_id < rhs.value_id
            } else {
                return lhs.subCategory < rhs.subCategory
            }
        } else {
            return lhs.category < rhs.category
        }
    }

}

extension Property.Builder: Hashable {
    
    public static func == (lhs: Property.Builder, rhs: Property.Builder) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }
    
    private var value: any BuildingProtocol {
        switch self {
        case .input(let inputBuilder): return inputBuilder
        case .mode(let modeEnum): return modeEnum
        case .format(let formatBuilder): return formatBuilder
        case .platform(let platformBuilder): return platformBuilder
        }
    }
    
}

public extension Property.Builder {
    
    var category: Property.Category {  self.value.category }
    var subCategory: Property.SubCategory { self.value.subCategory }
    var value_id: String { self.value.value_id }
    var value_display: String { self.value.value_display }
    
}
