//
//  Properties.swift
//  autosaved
//
//  Created by Asia Serrano on 6/19/23.
//

import Foundation

public enum Properties: EnumProtocol {
    
//    public enum Types: EnumProtocol {
//        case format
//        case genre
//        case publisher
//        case developer
//        case series
//
//        public init(_ input: String?) {
//            self = .initialize(input)!
//        }
//
//    }

    public enum Keys: EnumProtocol {
        case genre
        case publisher
        case developer
        case series
        case platform(Platforms)
        
        private static var regularCases: [Self] {
            [ self.genre, self.publisher, self.developer, self.series ]
        }
        
        public static var allCases: [Self] {
            regularCases + Platforms.allCases.map(Self.platform)
        }
        
        public var id: String {
            switch self {
            case .platform(let p): return p.id
            default: return Self.defaultId(self)
            }
        }
        
        public var value: String {
            switch self {
            case .platform(let p): return p.value
            default: return Self.defaultValue(self)
            }
        }
        
        public var isRegularCase: Bool {
            Self.regularCases.contains(self)
        }
        
        public init(_ input: String?) {
            self = .initialize(input)!
        }
        
    }

    public enum Values: EnumProtocol {
        case string(String)
        case format(Formats)
        
        public static var allCases: [Self] {
            Formats.allCases.map(Self.format) + [Self.string(.empty)]
        }
        
        public var id: String {
            switch self {
            case .string(let s): return s
            case .format(let f): return f.id
            }
        }
        
        public var value: String {
            switch self {
            case .string(let s): return s
            case .format(let f): return f.value
            }
        }
        
        public init(_ input: String? = nil) {
            self = {
                if let str: String = input?.trimmed {
                    if let format: Formats = .initialize(str) {
                        return .format(format)
                    } else { return .string(str) }
                } else { return .string(.empty) }
            }()
        }
        
    }
    
    case key(Keys)
    case value(Values)
    
    public static var allCases: [Properties] {
        Keys.allCases.map(Self.key) +
        Values.allCases.map(Self.value)
    }
    
    public static var justPlatforms: [Properties] {
        Platforms.allCases.map { Self.key(.platform($0)) }
    }
    
    public var id: String {
        switch self {
        case .key(let keys): return keys.id
        case .value(let values): return values.id
        }
    }
    
    public var value: String {
        switch self {
        case .key(let keys): return keys.value
        case .value(let values): return values.value
        }
    }
    
    public var toString: String {
        "id: \(self.id)\nvalue: \(self.value)"
    }
    
}


