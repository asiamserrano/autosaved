//
//  SortEnum.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import Protocols

public enum SortEnum: Enumerating {
    case release, title
    
    public var display: String {
        switch self {
        case .release:
            return "Release Date"
        case .title:
            return "Title"
        }
    }
}
