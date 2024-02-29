import SwiftUI

struct ProfileView: View {
    @State private var user: Users?
    @State private var showingLogoutAlert = false
    @State private var isLoggedOut = false
    @State private var isNavigationActive = false
    @State private var randomPhotoNumber = Int.random(in: 0...20)

    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 8) {
                    
                    // Random photo
                    if let imageURL = URL(string: "https://picsum.photos/800/600?random=\(randomPhotoNumber)") {
                        AsyncImage(url: imageURL)
                            .frame(width: 200, height: 200)
                            .cornerRadius(50)
                            .padding()
                    }
                    
                    Text("\(user?.firstName ?? "") \(user?.lastName ?? "")")
                        .font(.title)
                        .foregroundColor(.blue)
                    
                    Text(user?.email ?? "default@gmail.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 20)
            }
            .navigationBarItems(leading:
                Button(action: {
                    showingLogoutAlert = true
                }) {
                    Text("Log out")
                }
                .alert(isPresented: $showingLogoutAlert) {
                    Alert(
                        title: Text("Logout"),
                        message: Text("Are you sure you want to log out?"),
                        primaryButton: .destructive(Text("Logout")) {
                            logout()
                        },
                        secondaryButton: .cancel()
                    )
                }
            )
            .navigationBarItems(trailing:
                HStack {
                    NavigationLink(destination: EditProfileView(firstName: user?.firstName ?? "", lastName: user?.lastName ?? "", profilePic: user?.profilePic ?? "")) {
                        Image(systemName: "pencil")
                            .font(.title)
                    }
                    Spacer()
                }
            )
        }
        .onAppear {
            getUserData()
        }
        .background(
            NavigationLink(
                destination: FirstView(),
                isActive: $isNavigationActive,
                label: { EmptyView() }
            ).hidden()
        )
    }
    
    private func getUserData() {
        if let loggedInUserId = UserDefaults.standard.string(forKey: "loggedInUserId") {
            user = DBHelper.shared.getUser(userId: loggedInUserId)
        }
    }
    
    private func logout() {
        isLoggedOut = true
        isNavigationActive = true
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


#Preview {
    ProfileView()
}
