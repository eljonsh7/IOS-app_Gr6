//
//  Regions+CoreDataProperties.swift
//  IOS-app_Gr6
//
//  Created by Beslind Mema on 28.2.24.
//
//

import Foundation
import CoreData


extension Regions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Regions> {
        return NSFetchRequest<Regions>(entityName: "Regions")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var region_name: String?
    @NSManaged public var posts: NSSet?

}

// MARK: Generated accessors for posts
extension Regions {

    @objc(addPostsObject:)
    @NSManaged public func addToPosts(_ value: Posts)

    @objc(removePostsObject:)
    @NSManaged public func removeFromPosts(_ value: Posts)

    @objc(addPosts:)
    @NSManaged public func addToPosts(_ values: NSSet)

    @objc(removePosts:)
    @NSManaged public func removeFromPosts(_ values: NSSet)

}

extension Regions : Identifiable {

}
