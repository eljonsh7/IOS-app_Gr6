import Foundation
import CoreData


extension Posts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Posts> {
        return NSFetchRequest<Posts>(entityName: "Posts")
    }

    @NSManaged public var created_at: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var post_description: String?
    @NSManaged public var post_location: String?
    @NSManaged public var post_thumbnail: String?
    @NSManaged public var post_title: String?
    @NSManaged public var likes_count: Int64
    @NSManaged public var comment_count: Int64
    @NSManaged public var comments: NSSet?
    @NSManaged public var created_by: Users?
    @NSManaged public var likes: NSSet?
    @NSManaged public var region: Regions?

}

// MARK: Generated accessors for comments
extension Posts {

    @objc(addCommentsObject:)
    @NSManaged public func addToComments(_ value: Comments)

    @objc(removeCommentsObject:)
    @NSManaged public func removeFromComments(_ value: Comments)

    @objc(addComments:)
    @NSManaged public func addToComments(_ values: NSSet)

    @objc(removeComments:)
    @NSManaged public func removeFromComments(_ values: NSSet)

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
