import Foundation
import CoreData


extension Likes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Likes> {
        return NSFetchRequest<Likes>(entityName: "Likes")
    }

    @NSManaged public var id: String?
    @NSManaged public var created_at: Date?
    @NSManaged public var user: Users?
    @NSManaged public var post: Posts?

}

extension Likes : Identifiable {

}
