import SwiftUI
import CoreData

struct HomeView: View {
    @State private var items: [Item] = []

    struct Item {
        var image: String
        var id: UUID
        var title: String
        var description: String
        var likes: Int
        var messages: Int
        var location: String
    }
    
    var body: some View {
        ScrollView {
            Text("Choose region: ").font(.headline).padding(.top, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(1...7, id: \.self) { index in
                        Button(action: {
                            fetchPosts(region: "\(index)")
                        }) {
                            VStack {
                                Image("0\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 150)
                                    .clipped()
                                    .border(Color.black)
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 3)
            }
            
            Text("Most Liked: ").font(.headline).padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 30) {
                ForEach($items, id: \.title) { item in
                    PostItemCard(item: item, userId: UserDefaults.standard.string(forKey: "loggedInUserId") ?? "1")
                }
            }
        }
        .padding(.horizontal, 30)
        .onAppear {
            fetchPosts(region: "0")
        }
    }
    
    private func fetchPosts(region: String) {
        let regionName: String
        switch region {
            case "1": regionName = "Prishtina"
            case "2": regionName = "Mitrovica"
            case "3": regionName = "Peja"
            case "4": regionName = "Prizreni"
            case "5": regionName = "Ferizaj"
            case "6": regionName = "Gjilani"
            case "7": regionName = "Gjakova"
            default: regionName = ""
        }
        if region == "0" {
            let posts = DBHelper.shared.getPosts()
            items = posts.map { post in
                let image = "https://picsum.photos/800/600?random=2"
                return Item(image: image,
                            id: post.id ?? UUID(),
                            title: post.post_title ?? "",
                            description: post.post_description ?? "",
                            likes: Int(post.likes_count),
                            messages: Int(post.comment_count),
                            location: post.region?.region_name ?? "")
            }
        } else {
            let posts = DBHelper.shared.getPosts()
                for post in posts {
                    print(post.post_title ?? "Nothing")
                }
            items = posts.filter { post in
                post.post_title == regionName
            }.map { post in
                let image = "https://picsum.photos/800/600?random=2"
                return Item(image: image,
                            id: post.id ?? UUID(),
                            title: post.post_title ?? "",
                            description: post.post_description ?? "",
                            likes: Int(post.likes_count),
                            messages: Int(post.comment_count),
                            location: post.region?.region_name ?? "")
            }
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

#Preview {
    HomeView()
}
