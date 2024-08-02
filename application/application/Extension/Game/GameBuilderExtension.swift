//
//  GameBuilderExtension.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation
import Extensions

extension Game.Builder: GameProtocol {
    
    public static func random(_ status: StatusEnum = .random) -> Game.Builder {
        .init(.random, .random, status, nil)
    }
    
}
