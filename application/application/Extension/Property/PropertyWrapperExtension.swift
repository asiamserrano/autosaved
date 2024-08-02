//
//  PropertyWrapperExtension.swift
//  application
//
//  Created by Asia Serrano on 7/31/24.
//

import Foundation

//extension Game.Wrapper: Hashable {
//    
//    public static func == (lhs: Game.Wrapper, rhs: Game.Wrapper) -> Bool {
//        lhs.builder == rhs.builder
//    }
//
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(self.builder)
//    }
//    
//}

extension Property.Wrapper: ObservableObject {
    
    public func rollback() -> Void {
        self.value = self.property.value_display
    }
    
}
