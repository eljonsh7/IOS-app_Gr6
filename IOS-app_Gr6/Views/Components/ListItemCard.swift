import SwiftUI

struct ListItemCard: View {
    var item: Item

    var body: some View {
        HStack {
            Image("landscape")
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
        }
        .padding()
    }
}
