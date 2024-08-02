//
//  GamePredicateProtocol.swift
//  application
//
//  Created by Asia Serrano on 8/1/24.
//

import Foundation

public protocol GamePredicateProtocol: Hashable {
    var title_id: String { get }
    var release_date: String { get }
}
