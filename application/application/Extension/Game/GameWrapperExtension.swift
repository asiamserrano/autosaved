//
//  GameWrapperExtension.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import Extensions

extension Game.Wrapper: ObservableObject {
    
    public func rollback() -> Void {
        if let game: Game = self.game {
            self.title = game.title
            self.release = game.release
            self.boxart = game.boxart
        }
    }
    
}

extension Game.Wrapper: GameProtocol {
    
    public var isUnchanged: Bool {
        self.game?.hashValue == self.hashValue || self.title.isEmpty
    }
    
}


