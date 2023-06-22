//
//  Enum+Protocol.swift
//  autosaved
//
//  Created by Asia Serrano on 6/18/23.
//

import Foundation

public protocol EnumProtocol: Identifiable, Equatable, Hashable, CaseIterable, Comparable {
    
    var id: String { get }
    var value: String { get }
    var hashed: Int { get }
    
}

public extension EnumProtocol {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.value == rhs.value
    }
    
    static func === (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    static func defaultId(_ s: Self) -> String {
        String(describing: s)
    }
    
    static func defaultValue(_ s: Self) -> String {
        s.id.capitalized
    }
    
    static func initialize(_ str: String?) -> Self? {
        Self.allCases.first(where: { [$0.id, $0.value].contains(str?.trimmed) })
    }
    
    static var random: Self {
        .allCases.randomElement()!
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashed)
    }
    
    var id: String {
        Self.defaultId(self)
    }
    
    var value: String {
        Self.defaultValue(self)
    }
    
    var hashed: Int {
        self.id.hashed
    }
    
}
