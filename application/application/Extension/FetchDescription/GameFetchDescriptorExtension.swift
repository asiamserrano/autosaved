//
//  GameFetchDescriptorExtension.swift
//  sanfrancisco
//
//  Created by Asia Serrano on 7/21/24.
//

import Foundation
import SwiftData

public typealias GameFetchDescriptor = FetchDescriptor<Game>

public extension FetchDescriptor where T: Game {
    
    static func game(_ game: Game, _ descriptors: GameSortDescriptors = .init()) -> GameFetchDescriptor {
        .build(.game(game), descriptors)
    }
    
    static func wrapper(_ wrapper: Game.Wrapper, _ descriptors: GameSortDescriptors = .init()) -> GameFetchDescriptor {
        .build(.wrapper(wrapper), descriptors)
    }
    
}
