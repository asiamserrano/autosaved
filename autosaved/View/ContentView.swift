//
//  ContentView.swift
//  autosaved
//
//  Created by Asia Serrano on 6/3/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
//    @Environment(\.managedObjectContainer) private var container

    
    private let classes: [AnyClass] = [Property.self, Game.self, AppEntity.self]
    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var properties: FetchedResults<Property>
    
    @State private var input: String = .empty
//    @State private var merge: Bool = true
//    @State private var policy: NSMergePolicy = .mergeByPropertyObjectTrump
    
    private var disabled: Bool {
        self.input.isEmpty
    }
    
//    private var isObjectPolicy: Bool {
//        self.policy == .mergeByPropertyObjectTrump
//    }

    private var mergePolicy: String {
        switch self.viewContext.policy {
        case .error: return "error"
        case .mergeByPropertyStoreTrump: return "store"
        case .mergeByPropertyObjectTrump: return "object"
        case .overwrite: return "overwrite"
        case .rollback: return "rollback"
        default: return "unknown"
        }
    }
        
    var body: some View {
        NavigationView {
            VStack {
                
                VStack {
                    Text(self.mergePolicy)
                    TextField("New Developer", text: $input)
                    Button(action: {
                        do {
                            Property.createInputProperty(.developer, self.input)
                            try self.viewContext.save()
                            print("saved!")
                            self.viewContext.changePolicy()
                        } catch {
                            print("error! -> \(error.localizedDescription)")
                            self.viewContext.rollback()
                        }
                        self.input = .empty
                    }, label: {
                        Text("Add")
                    }).disabled(self.disabled)
                
                }.padding()
                
                List {
                    ForEach(properties) { p in
                        VStack(alignment: .leading) {
                            Text("key: \(p.key.value)")
                            Text("value: \(p.value.value)")
                            Text("identifier: \(p.identifier)")
                            Text("size: \(p.games.count)")
                        }
                    }
                }
            }
            
        }
        
    }
    
//    func createClassName(_ cls: AnyClass) -> String {
////        String(describing: cls.self)
//        let desc: NSEntityDescription = PersistenceController.getEntity(cls)
//        return desc.name!
//    }
    
    @ViewBuilder
    func PropView(_ p: Properties) -> some View {
        PropView(p.id, p.value)
    }
    
    @ViewBuilder
    func PropView(_ p: Platforms) -> some View {
        PropView(p.id, p.value)
    }
    
    @ViewBuilder
    func PropView(_ a: String, _ b: String) -> some View {
        VStack(alignment: .leading) {
            Text(a)
            Text(b)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .environment(\.managedObjectContainer, PersistenceController.local.container)
    }
}
