//
//  Collection+Extension.swift
//  autosaved
//
//  Created by Asia Serrano on 6/19/23.
//

import Foundation

extension Collection where Element == String {
    
    public var toSet: Set<Element> {
        Set(self)
    }
    
    public var toArray: [Element] {
        self.sorted()
    }
    
    public var canonicalized: String {
        self.filter { !$0.isEmpty }
            .map { $0.canonicalized }
            .toSet
            .toArray
            .description
    }
}
