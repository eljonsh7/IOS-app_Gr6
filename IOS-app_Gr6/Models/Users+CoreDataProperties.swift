import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var profilePic: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var posts: NSSet?
    @NSManaged public var likes: NSSet?

}

// MARK: Generated accessors for posts
extension Users {

    @objc(addPostsObject:)
    @NSManaged public func addToPosts(_ value: Posts)

    @objc(removePostsObject:)
    @NSManaged public func removeFromPosts(_ value: Posts)

    @objc(addPosts:)
    @NSManaged public func addToPosts(_ values: NSSet)

    @objc(removePosts:)
    @NSManaged public func removeFromPosts(_ values: NSSet)

}

// MARK: Generated accessors for likes
extension Users {

    @objc(addLikesObject:)
    @NSManaged public func addToLikes(_ value: Likes)

    @objc(removeLikesObject:)
    @NSManaged public func removeFromLikes(_ value: Likes)

    @objc(addLikes:)
    @NSManaged public func addToLikes(_ values: NSSet)

    @objc(removeLikes:)
    @NSManaged public func removeFromLikes(_ values: NSSet)

}

extension Users : Identifiable {

}
