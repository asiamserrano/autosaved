//
//  GameSortDescriptionExtension.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import SwiftUI
import SwiftData

public typealias GameSortDescriptor = SortDescriptor<Game>
public typealias GameSortDescriptors = [GameSortDescriptor]

fileprivate extension GameSortDescriptor {

    static func byRelease(_ order: SortOrder) -> Self {
        .init(\.release_date, order: order)
    }
    
    static func byTitle(_ order: SortOrder) -> Self {
        .init(\.title_id, order: order)
    }
    
}

public extension GameSortDescriptors {
    
    static func build(_ ascending: Bool, _ sort: SortEnum) -> Self {
        let order: SortOrder = ascending ? .forward : .reverse
        
        switch sort {
        case .release:
            return [ .byRelease(order), .byTitle(.forward) ]
        case .title:
            return [ .byTitle(order), .byRelease(.forward) ]
        }
    }
    
}
