import SwiftUI

struct Item {
    var image: Image
    var id: UUID
    var title: String
    var description: String
    var likes: Int
    var messages: Int
    var location: String
}

struct MyPostsView: View {
    @State private var items: [Item] = []
    @State private var isAddPostViewPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.id) { item in
                    ListItemCard(item: item)
                }
            }
            .navigationBarTitle("My Posts")
            .navigationBarItems(trailing:
                Button(action: {
                    isAddPostViewPresented.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $isAddPostViewPresented) {
                AddPostView()
            }
            .onAppear {
                fetchPosts()
            }
        }
    }
    
    private func fetchPosts() {
        let userId = UserDefaults.standard.string(forKey: "loggedInUserId") ?? "1"
        
        let posts = DBHelper.shared.getPosts()
        items = posts.map { post in
            let image = Image("landscape")
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

struct MyPostsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPostsView()
    }
}

#Preview {
    MyPostsView()
}
