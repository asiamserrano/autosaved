//
//  FetchDescriptionExtension.swift
//  sanfrancisco
//
//  Created by Asia Serrano on 7/19/24.
//

import Foundation
import SwiftData

public extension FetchDescriptor where T: Any {
        
    static func build(_ predicate: Predicate<T>?, _ descriptors: [SortDescriptor<T>] = .init()) -> Self {
        if let pred: Predicate<T> = predicate {
            return .init(predicate: pred, sortBy: descriptors)
        } else {
            return .init(sortBy: descriptors)
        }
    }
    
}
