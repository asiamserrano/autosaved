//
//  AppEntity+CoreData.swift
//  autosaved
//
//  Created by Asia Serrano on 6/19/23.
//
//

import Foundation
import CoreData

@objc(AppEntity)
public class AppEntity: NSManagedObject, Identifiable {
    
    public static let viewContext: NSManagedObjectContext = PersistenceController.local.container.viewContext
    
    private var getIdentifierElementsId: String {
        self.identifier_elements.canonicalized
    }
    
    public var identifier_elements: [String] { [] }
    
    public func setIdentifier() -> Void {
        self.identifier = self.getIdentifierElementsId
    }
    
}

extension AppEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppEntity> {
        return NSFetchRequest<AppEntity>(entityName: "AppEntity")
    }

    @NSManaged private var identifier_string: String?

}

extension AppEntity {

    var identifier: String {
        get { self.identifier_string ?? self.getIdentifierElementsId }
        set { self.identifier_string = newValue }
    }
    
}
