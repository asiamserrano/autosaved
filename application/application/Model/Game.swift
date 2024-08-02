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
    
    public init(_ game: any GameProtocol) {
        self.uuid = .init()
        self.added = .today
        self.title_id = game.title_id
        self.title_display = game.title_display
        self.release_date = game.release_date
        self.status_bool = game.status_bool
        self.boxart_data = game.boxart_data
    }
    
//    public init(_ wrapper: Wrapper) {
//        self.uuid = .init()
//        self.added = .today
//        self.title_id = wrapper.title_id
//        self.title_display = wrapper.title_display
//        self.release_date = wrapper.release_date
//        self.status_bool = wrapper.status_bool
//        self.boxart_data = wrapper.boxart_data
//    }
    
//    public init(_ title: String, _ release: Date, _ status: StatusEnum = .library, _ boxart: Data? = nil) {
//        self.uuid = .init()
//        self.added = .today
//        self.title_id = title.canonicalized
//        self.title_display = title.trimmed
//        self.release_date = release.dashless
//        self.status_bool = status.bool
//        self.boxart_data = boxart
//    }
    
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
    
    public struct Builder {

        public let title: String
        public let release: Date
        public let status: StatusEnum
        public let boxart: Data?
        
        public init(_ str: String, _ date: Date, _ status: StatusEnum, _ data: Data?) {
            self.title = str.trimmed
            self.release = date
            self.status = status
            self.boxart = data
        }
        
    }
    
}
