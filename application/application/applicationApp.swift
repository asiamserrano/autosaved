//
//  applicationApp.swift
//  application
//
//  Created by Asia Serrano on 7/30/24.
//

import SwiftUI
import SwiftData

public typealias UUIDS = [UUID]

@main
struct applicationApp: App {
    
    var body: some Scene {
     
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Container.models, inMemory: false, isAutosaveEnabled: false, isUndoEnabled: true)
    }
    
}
