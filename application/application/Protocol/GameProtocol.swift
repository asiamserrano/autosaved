//
//  GameProtocol.swift
//  application
//
//  Created by Asia Serrano on 8/1/24.
//

import Foundation


public protocol GameProtocol: GamePredicateProtocol {
    var title: String { get }
    var release: Date { get }
    var status: StatusEnum { get }
    var boxart: Data? { get }
}

public extension GameProtocol {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.title_display)
        hasher.combine(self.release_date)
        hasher.combine(self.boxart_data)
    }
    
    var title_id: String { self.title.canonicalized }
    var title_display: String { self.title.trimmed }
    var release_date: String { self.release.dashless }
    var status_bool: Bool { self.status.bool }
    var boxart_data: Data? { self.boxart }
    
}
