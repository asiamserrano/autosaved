//
//  GameExtension.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import Extensions

extension Game: Hashable {
    
    public static func == (lhs: Game, rhs: Game) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.game(self.title, self.release, self.boxart)
    }
    
}

public extension Game {
    
    static func random(_ status: StatusEnum = .random) -> Game {
        return .init(.random, .random, status)
    }
    
    var title: String { self.title_display }
    var release: Date { .init(self.release_date) }
    var boxart: Data? { self.boxart_data }
    var display: String { "\(self.title) (\(self.release.year))" }
    var status: StatusEnum { .init(self.status_bool) }
    
}
