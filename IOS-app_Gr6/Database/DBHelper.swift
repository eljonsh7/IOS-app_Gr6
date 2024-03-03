import CoreData

class DBHelper {
    static let shared = DBHelper()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func addUser(firstName: String, lastName: String, email: String, password: String, profilePic: String) {
        let managedContext = persistentContainer.viewContext
        let user = Users(context: managedContext)
        user.id = UUID()
        user.firstName = firstName
        user.lastName = lastName
        user.email = email
        user.password = password
        user.profilePic = profilePic
        
        saveContext()
    }
    
    func loginUser(email: String, password: String) -> Users? {
        let managedContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)
        
        do {
            let users = try managedContext.fetch(fetchRequest)
            return users.first
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func getUser(userId: String) -> Users? {
        let managedContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", userId)
        
        do {
            let users = try managedContext.fetch(fetchRequest)
            return users.first
        } catch let error as NSError {
            print("Could not fetch user. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func getUsers() -> [Users] {
        let managedContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        do {
            let users = try managedContext.fetch(fetchRequest)
            return users
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    func getRegionByName(name: String) -> Regions? {
        let managedContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Regions> = Regions.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "region_name == %@", name)
        
        do {
            let regions = try managedContext.fetch(fetchRequest)
            return regions.first
        } catch let error as NSError {
            print("Could not fetch region. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func addPost(title: String, description: String, thumbnail: String, region: String, userId: String) {
        let managedContext = persistentContainer.viewContext
        let post = Posts(context: managedContext)
        post.id = UUID()
        post.post_title = title
        post.post_description = description
        post.post_thumbnail = thumbnail
        post.created_by = getUser(userId: userId)
        post.comment_count = 0
        post.likes_count = 0
        post.region = getRegionByName(name: region)
        
        saveContext()
    }
    
    func addLike(userId: String, postId: String) {
        let managedContext = persistentContainer.viewContext
        let like = Likes(context: managedContext)
        like.user = getUser(userId: userId)
        like.post = getPostById(postId: postId)
        like.created_at = Date()
        
        saveContext()
    }
    
    func removeLike(userId: String, postId: String) {
        let managedContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Likes> = Likes.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "user.id == %@ AND post.id == %@", userId, postId)

        do {
            let likes = try managedContext.fetch(fetchRequest)
            for like in likes {
                managedContext.delete(like)
            }
            saveContext()
        } catch let error as NSError {
            print("Could not fetch likes to remove. \(error), \(error.userInfo)")
        }
    }
    
    func isLiked(userId: String, postId: UUID) -> Bool {
//        let managedContext = persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<Likes> = Likes.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "user.id == %@ AND post.id == %@", userId, postId as CVarArg)

//        do {
//            let likes = try managedContext.fetch(fetchRequest)
            return false
//        } catch let error as NSError {
//            print("Could not fetch likes. \(error), \(error.userInfo)")
//            return false
//        }
    }
    
    func getLikesForPost(post: Posts) -> [Likes] {
        let managedContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Likes> = Likes.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "post == %@", post)
        do {
            let likes = try managedContext.fetch(fetchRequest)
            return likes
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    func getPostsByUserId(userId: String) -> [Posts] {
        let managedContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Posts> = Posts.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "created_by.id == %@", userId)
        
        do {
            let posts = try managedContext.fetch(fetchRequest)
            return posts
        } catch let error as NSError {
            print("Could not fetch posts. \(error), \(error.userInfo)")
            return []
        }
    }
    
    func getPostsByRegion(regionName: String) -> [Posts] {
        let managedContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Posts> = Posts.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "region.region_name == %@", regionName)
        
        do {
            let posts = try managedContext.fetch(fetchRequest)
            return posts
        } catch let error as NSError {
            print("Could not fetch posts by region. \(error), \(error.userInfo)")
            return []
        }
    }
    
    func getPosts() -> [Posts] {
        let managedContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Posts> = Posts.fetchRequest()
        
        do {
            let posts = try managedContext.fetch(fetchRequest)
            return posts
        } catch let error as NSError {
            print("Could not fetch posts. \(error), \(error.userInfo)")
            return []
        }
    }

    func getPostById(postId: String) -> Posts? {
        let managedContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Posts> = Posts.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", postId)
        
        do {
            let posts = try managedContext.fetch(fetchRequest)
            return posts.first
        } catch let error as NSError {
            print("Could not fetch post. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func addRegion(name: String) {
        let managedContext = persistentContainer.viewContext
        let region = Regions(context: managedContext)
        region.region_name = name
        
        saveContext()
    }
    
    func getRegions() -> [Regions] {
        let managedContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Regions> = Regions.fetchRequest()
        
        do {
            let regions = try managedContext.fetch(fetchRequest)
            return regions
        } catch let error as NSError {
            print("Could not fetch regions. \(error), \(error.userInfo)")
            return []
        }
    }

    
    private func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
}
