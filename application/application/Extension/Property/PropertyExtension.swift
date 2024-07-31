//
//  PropertyExtension.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import Protocols

public extension Property {
    
    enum SubCategory: Enumerating {
        case series
        case developer
        case publisher
        case genre
        case mode
        case physical
        case digital
        case playstation
        case nintendo
        case os
        case xbox
    }
    
    enum Category: Enumerating {
        case input
        case mode
        case format
        case platform
    }
    
}
