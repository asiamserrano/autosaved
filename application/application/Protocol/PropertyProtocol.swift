//
//  PropertyProtocol.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import Protocols

public protocol PropertyProtocol: Displaying, Comparable {
    
    var value_id: String { get }
    var value_display: String { get }
    var category_id: String { get }
    var subcategory_id: String { get }
    
}
