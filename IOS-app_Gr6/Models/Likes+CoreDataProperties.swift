//
//  Likes+CoreDataProperties.swift
//  IOS-app_Gr6
//
//  Created by Beslind Mema on 28.2.24.
//
//

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
