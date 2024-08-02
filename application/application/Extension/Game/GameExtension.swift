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
        lhs.wrapper == rhs.wrapper
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.wrapper)
    }
    
    private var wrapper: Game.Wrapper {
        .init(self)
    }
   
    
}

extension Game: GamePredicateProtocol {
    
    public static func random(_ status: StatusEnum = .random) -> Game {
        let builder: Game.Builder = .random(status)
        return .init(builder)
    }
    
    public var display: String {
        "\(self.title) (\(self.release.year))"
    }
    
    public var title: String { self.title_display }
    public var release: Date { .init(self.release_date) }
    public var status: StatusEnum { .init(self.status_bool) }
    public var boxart: Data? { self.boxart_data }
    
//    public var builder: Game.Builder {
//        .init(self.title, self.release, self.status, self.boxart)
//    }
    
}
