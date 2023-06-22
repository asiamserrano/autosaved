//
//  Game+CoreDataProperties.swift
//  autosaved
//
//  Created by Asia Serrano on 6/19/23.
//
//

import Foundation
import CoreData
import SwiftUI

@objc(Game)
public class Game: AppEntity {

//    @Published
//    public var added: Date {
//        get { self.add_date ?? .today }
//        set { self.add_date = newValue }
//    }
    
    
    
    @Published public var added: Date = .today
    
    public var boxartImage: Image {
        Image(self.boxartUIImage)
    }
    
    public override var identifier_elements: [String] {
        [self.title.canonicalized, self.released.dashless]
    }
    
}

extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged private var add_date: Date?
    @NSManaged private var title_string: String?
    @NSManaged private var image_data: Data?
    @NSManaged private var release_date: Date?
    @NSManaged private var wishlist_boolean: Bool
    @NSManaged private var single_boolean: Bool
    @NSManaged private var multi_boolean: Bool
    @NSManaged private var property_set: NSSet?
    
    

}

// MARK: Generated accessors for property_set
extension Game {

    @objc(addProperty_setObject:)
    @NSManaged public func addToProperty_set(_ value: Property)

    @objc(removeProperty_setObject:)
    @NSManaged public func removeFromProperty_set(_ value: Property)

    @objc(addProperty_set:)
    @NSManaged public func addToProperty_set(_ values: NSSet)

    @objc(removeProperty_set:)
    @NSManaged public func removeFromProperty_set(_ values: NSSet)

}

extension Game {

    
    
    public var released: Date {
        get { self.release_date ?? .today }
        set { self.release_date = newValue }
    }
    
    public var title: String {
        get { self.title_string ?? .empty }
        set { self.title_string = newValue.trimmed }
    }
    
    public var boxartUIImage: UIImage {
        get { UIImage(self.image_data) }
        set { self.image_data = newValue.data }
    }
    
    public var isWishlistGame: Bool {
        get { self.wishlist_boolean }
        set { self.wishlist_boolean = newValue }
    }
    
    public var isSinglePlayerGame: Bool {
        get { self.single_boolean }
        set { self.single_boolean = newValue }
    }
    
    public var isMultiplayerGame: Bool {
        get { self.multi_boolean }
        set { self.multi_boolean = newValue }
    }
    
    public var properties: Set<Property> {
        get { self.property_set as? Set<Property> ?? [] }
        set { self.property_set = NSSet(set: newValue) }
    }
    
}
