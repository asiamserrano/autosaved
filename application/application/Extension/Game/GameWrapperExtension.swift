//
//  GameWrapperExtension.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import Extensions

extension Game.Wrapper: Hashable {
    
    public static func == (lhs: Game.Wrapper, rhs: Game.Wrapper) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.game(self.title, self.release, self.boxart)
    }
    
}

extension Game.Wrapper: ObservableObject {
    
    public func rollback() -> Void {
        if let game: Game = self.game {
            self.title = game.title
            self.release = game.release
            self.boxart = game.boxart
        }
    }
    
}

public extension Game.Wrapper {
    
//    var hasChanges: Bool {
//        self.game.hashValue != self.hashValue && self.title_display.isNotEmpty
//    }
    
    var isUnchanged: Bool {
        self.game?.hashValue == self.hashValue || self.title.isEmpty
    }
    
    var title_id: String {
        self.title.canonicalized
    }
    
    var title_display: String {
        self.title.trimmed
    }
    
    var release_date: String {
        self.release.dashless
    }
    
}


