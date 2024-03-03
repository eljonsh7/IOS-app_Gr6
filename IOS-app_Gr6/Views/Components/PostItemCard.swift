import SwiftUI

struct PostItemCard: View {
    @Binding var item: HomeView.Item
    @State private var isLiked: Bool
    var userId: String
    var postId: UUID

    var likeAction: (() -> Void)?

    init(item: Binding<HomeView.Item>, userId: String, likeAction: (() -> Void)? = nil) {
        self._item = item
        self._isLiked = State(initialValue: DBHelper.shared.isLiked(userId: userId, postId: item.wrappedValue.id))
        self.userId = userId
        self.postId = item.wrappedValue.id
        self.likeAction = likeAction
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            if let imageURL = URL(string: item.image) {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width, height: 200)
                            .cornerRadius(10)
                            .padding()
                    case .failure(_):
                        // Placeholder or error handling
                        EmptyView()
                    case .empty:
                        ProgressView()
                    @unknown default:
                        EmptyView()
                    }
                }
            }

//            GeometryReader { geometry in
//                item.image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: geometry.size.width, height: 200)
//                    .clipped()
//            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(item.title)
                        .font(.title)
                    Spacer()
                    HStack {
                        Image(systemName: "pin")
                        Text(item.location)
                            .font(.caption)
                    }
                    .padding(.trailing, 10)
                }
                
                Text(item.description)
                    .font(.body)
            }
            .padding(.horizontal, 30)
            
            HStack {
                Button(action: {
                    isLiked.toggle()
                    if isLiked {
//                        DBHelper.shared.addLike(userId: userId, postId: postId.uuidString)
                        item.likes += 1
                    } else {
//                        DBHelper.shared.removeLike(userId: userId, postId: postId.uuidString)
                        item.likes -= 1
                    }
                    likeAction?()
                }) {
                    if isLiked {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    } else {
                        Image(systemName: "heart")
                            .foregroundColor(.black)
                    }
                }
                
                Text("\(item.likes)")
            }
            .padding(.horizontal, 30)
        }
        .frame(height: 300)
        .padding(.bottom, 14)
    }
}
