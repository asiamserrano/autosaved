//
//  Property+CoreDataProperties.swift
//  autosaved
//
//  Created by Asia Serrano on 6/19/23.
//
//

import Foundation
import CoreData

@objc(Property)
public class Property: AppEntity {
    
    @discardableResult
    public static func createInputProperty(_ key: Properties.Keys, _ string: String) -> Property {
        let property: Property = .init(context: viewContext)
        property.key = key
        property.value = .string(string)
        return property
    }
    
    @discardableResult
    public static func createFormatProperty(_ platform: Platforms, _ format: Formats) -> Property {
        let property: Property = .init(context: viewContext)
        property.key = .platform(platform)
        property.value = .format(format)
        return property
    }
    
    public override var identifier_elements: [String] {
        [ self.key.value.canonicalized, self.value.value.canonicalized ]
    }
    
}

extension Property {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Property> {
        return NSFetchRequest<Property>(entityName: "Property")
    }
    
    @NSManaged private var value_string: String?
    @NSManaged private var key_string: String?
    @NSManaged private var game_set: NSSet?

    @objc(addGame_setObject:)
    @NSManaged public func addToGame_set(_ value: Game)

    @objc(removeGame_setObject:)
    @NSManaged public func removeFromGame_set(_ value: Game)

    @objc(addGame_set:)
    @NSManaged public func addToGame_set(_ values: NSSet)

    @objc(removeGame_set:)
    @NSManaged public func removeFromGame_set(_ values: NSSet)
    
}

extension Property {

    public var key: Properties.Keys {
        get { .init(self.key_string) }
        set { self.key_string = newValue.id }
    }
    
    public var value: Properties.Values {
        get { .init(self.value_string) }
        set {
            self.value_string = self.key.isRegularCase ? newValue.value : newValue.id
            self.setIdentifier()
        }
    }
    
    public var games: Set<Game> {
        get { self.game_set as? Set<Game> ?? [] }
        set {
            self.game_set = NSSet(set: newValue)
            self.setIdentifier()
        }
    }
    
}
