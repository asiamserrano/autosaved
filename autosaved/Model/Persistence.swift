//
//  Persistence.swift
//  autosaved
//
//  Created by Asia Serrano on 6/3/23.
//

import CoreData

struct PersistenceController {
    
    static let shared: PersistenceController = PersistenceController()
    
    static let local: PersistenceController = PersistenceController(inMemory: true)
//    static let viewContext: NSManagedObjectContext = PersistenceController.local.container.viewContext
    
    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "autosaved")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        container.viewContext.policy = .mergeByPropertyObjectTrump
//        container.viewContext.automaticallyMergesChangesFromParent = true
//        container.viewContext.mergePolicy = Self.mergePolicies[self.index]
  
    }
    
    static var preview: PersistenceController = {
        
//        let property: Property = Property(context: Self.local.container.viewContext)
//        property.key = .series
//        property.value = .string("Grand Theft Auto")
//
//        let property2: Property = Property(context: viewContext)
//        property2.key = .platform(.playstation(.PS2))
//        property2.value = .format(.physical(.disc))
        
        do {
            Property.createInputProperty(.developer, "Rockstar North")
            Property.createFormatProperty(.playstation(.PS4), .physical(.disc))
            try Self.local.container.viewContext.save()
            print("saved")
        } catch {
            print("ERROR: \(error.localizedDescription)")
            Self.local.container.viewContext.rollback()
        }
        
        return local
    }()
    
}

extension NSManagedObjectContext {
    
    private static let mergePolicies: [NSMergePolicy] = [
//        .error,
        .rollback,
        .overwrite,
        .mergeByPropertyObjectTrump,
        .mergeByPropertyStoreTrump
    ]
    
    public var policy: NSMergePolicy {
        get { self.mergePolicy as? NSMergePolicy ?? .error }
        set { self.mergePolicy = newValue }
    }
    
    public func changePolicy() -> Void {
        var new: Int {
            switch self.policy {
//            case .error: return 1
            case .rollback: return 1
            case .overwrite: return 2
            case .mergeByPropertyObjectTrump: return 3
            default: return 0
            }
        }
        print("new: \(new)")
        self.policy = Self.mergePolicies[new]
    }
    
}
