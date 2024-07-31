//
//  Game.swift
//  application
//
//  Created by Asia Serrano on 7/30/24.
//

import Foundation
import SwiftData
import Extensions
import SwiftUI

public typealias Games = [Game]

@Model
public class Game {
    
    public let uuid: UUID
    public let added: Date
    
    public var title_id: String
    public var title_display: String
    public var release_date: String
    public var status_bool: Bool
    public var boxart_data: Data?
    
//    public private (set) var title_id: String
//    public private (set) var title_display: String
//    public private (set) var release_date: String
//    public private (set) var status_bool: Bool
//    public private (set) var boxart_data: Data?
    
//    public init() {
//        self.uuid = .init()
//        self.added = .today
//        self.title_id = .empty
//        self.title_display = .empty
//        self.release_date = .empty
//        self.status_bool = true
//        self.boxart_data = nil
//    }
    
    public init(_ title: String, _ release: Date, _ status: StatusEnum = .library, _ boxart: Data? = nil) {
        self.uuid = .init()
        self.added = .today
        self.title_id = title.canonicalized
        self.title_display = title.trimmed
        self.release_date = release.dashless
        self.status_bool = status.bool
        self.boxart_data = boxart
    }
    
    public class Wrapper {
        
        @Published public var title: String
        @Published public var release: Date
        @Published public var boxart: Data?
        @Published public var editMode: EditMode
        
        public let game: Game?
        public let status: StatusEnum
        
        public init(_ status: StatusEnum) {
            self.title = .empty
            self.release = .today
            self.boxart = nil
            self.game = nil
            self.status = status
            self.editMode = .active
        }
        
        public init(_ game: Game) {
            self.title = game.title
            self.release = game.release
            self.boxart = game.boxart
            self.game = game
            self.status = game.status
            self.editMode = .inactive
        }
        
    }
    
}
