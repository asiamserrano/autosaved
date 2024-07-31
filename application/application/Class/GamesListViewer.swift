//
//  GamesListViewer.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation

public class GamesListViewer: ObservableObject {
    
    @Published var search: String
    @Published var addGame: Bool
    @Published var sortEnum: SortEnum
    @Published var ascending: Bool
    
    let statusEnum: StatusEnum
    
    public init(_ statusEnum: StatusEnum) {
        self.search = .empty
        self.addGame = false
        self.sortEnum = .title
        self.ascending = true
        self.statusEnum = statusEnum
    }
    
    public var filter: GamePredicate {
        .list(statusEnum, search)
    }
    
    public var sorts: GameSortDescriptors {
        .build(ascending, sortEnum)
    }
    
}
