import SwiftUI

struct ItemCardView: View {
    var image: Image
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: 200)
                    .clipped()
            }
            
            VStack(alignment: .center, spacing: 8) {
                Text(title)
                    .font(.title)
                
                Text(description)
                    .font(.body)
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    ItemCardView(image: Image("landscape"), title: "Title 2", description: "Description 2")
}
