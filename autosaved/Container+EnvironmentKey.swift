//
//  Container+EnvironmentKey.swift
//  autosaved
//
//  Created by Asia Serrano on 6/22/23.
//

import Foundation
import CoreData
import SwiftUI

private struct ManagedObjectContainer: EnvironmentKey {
    // 1
    static let defaultValue: NSPersistentContainer = PersistenceController.local.container
}

extension EnvironmentValues {
    
    var managedObjectContainer: NSPersistentContainer {
        get { self[ManagedObjectContainer.self] }
        set { self[ManagedObjectContainer.self] = newValue }
    }
    
}
