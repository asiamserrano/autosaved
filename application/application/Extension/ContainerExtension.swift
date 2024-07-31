//
//  ContainerExtension.swift
//  sanfrancisco
//
//  Created by Asia Serrano on 7/19/24.
//

import Foundation
import SwiftData

public typealias Container = ModelContainer

extension Container {
    
    public static var models: [any PersistentModel.Type] = [ Game.self ]
    
    private convenience init(memory: Bool) {
        do {
            let schema: Schema = .init(Self.models)
            let config: ModelConfiguration = .init(schema: schema, isStoredInMemoryOnly: memory)
            try self.init(for: schema, configurations: [config])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    public static let preview: ModelContainer = .init(memory: true)
    
}
