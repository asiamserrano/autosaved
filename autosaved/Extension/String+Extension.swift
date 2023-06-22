//
//  String+Extension.swift
//  autosaved
//
//  Created by Asia Serrano on 6/18/23.
//

import Foundation

extension String {
    
    public static let null: String = "null"
    
    public static var empty: Self {
        Self()
    }
    
    public var trimmed: Self {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public var canonicalized: Self {
        self.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
    }
    
    public var pluralized: Self {
        "\(self)s"
    }
    
    public var hashed: Int {
        self.canonicalized.utf8.reduce(5381) {
            ($0 << 5) &+ $0 &+ Int($1)
        }
    }
    
    public var isEmpty: Bool {
        self.canonicalized.count == 0
    }
    
    
}
