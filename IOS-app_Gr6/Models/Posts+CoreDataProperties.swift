//
//  Posts+CoreDataProperties.swift
//  IOS-app_Gr6
//
//  Created by Beslind Mema on 28.2.24.
//
//

import Foundation
import CoreData


extension Posts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Posts> {
        return NSFetchRequest<Posts>(entityName: "Posts")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var post_thumbnail: String?
    @NSManaged public var post_description: String?
    @NSManaged public var post_title: String?
    @NSManaged public var post_location: String?
    @NSManaged public var created_at: Date?
    @NSManaged public var created_by: Users?
    @NSManaged public var region: Regions?
    @NSManaged public var likes: NSSet?

}

// MARK: Generated accessors for likes
extension Posts {

    @objc(addLikesObject:)
    @NSManaged public func addToLikes(_ value: Likes)

    @objc(removeLikesObject:)
    @NSManaged public func removeFromLikes(_ value: Likes)

    @objc(addLikes:)
    @NSManaged public func addToLikes(_ values: NSSet)

    @objc(removeLikes:)
    @NSManaged public func removeFromLikes(_ values: NSSet)

}

extension Posts : Identifiable {

}
