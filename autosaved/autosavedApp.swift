//
//  autosavedApp.swift
//  autosaved
//
//  Created by Asia Serrano on 6/3/23.
//

import SwiftUI

@main
struct autosavedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
