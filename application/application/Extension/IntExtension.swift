//
//  IntExtension.swift
//  application
//
//  Created by Asia Serrano on 7/30/24.
//

import Foundation

public extension Hasher {
    
    mutating func game(_ str: String, _ dt: Date, _ da: Data? = nil) {
        self.combine(str.trimmed)
        self.combine(dt.dashless)
        self.combine(da)
    }
    
}

public extension Int {
    
    static func game(_ str: String, _ dt: Date, _ da: Data? = nil) -> Self {
        var hasher: Hasher = .init()
        hasher.game(str, dt, da)
        return hasher.finalize()
    }
    
}
