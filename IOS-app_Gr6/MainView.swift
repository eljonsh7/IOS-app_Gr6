import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem() {
                    Image(systemName: "house")
                    Text("Home")
                }
            MyPostView()
                .tabItem() {
                    Image(systemName: "slider.horizontal.3")
                    Text("Home")
                }
            ProfileView()
                .tabItem() {
                    Image(systemName: "person")
                    Text("Home")
                }
        }
    }
}

#Preview {
    MainView()
}
