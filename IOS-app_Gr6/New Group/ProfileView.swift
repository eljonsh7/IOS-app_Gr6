import SwiftUI

protocol ProfileViewDelegate: AnyObject {
    func didLogout()
}


struct ProfileView: View {
    weak var delegate: ProfileViewDelegate?
    
    @State private var isEditingProfile = false
    @State private var showingLogoutAlert = false
    @State private var isLoggedOut = false // Added state variable to track logout

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .padding(.top, 50)
                    .foregroundColor(.blue)
                
                VStack(spacing: 8) {
                    Text("John Doe")
                        .font(.title)
                        .foregroundColor(.blue)
                    Text("john.doe@example.com")
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
                            delegate?.didLogout() // Call delegate method on logout
                        },
                        secondaryButton: .cancel()
                    )
                }
            )
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        isEditingProfile = true
                    }) {
                        Image(systemName: "pencil")
                            .font(.title)
                    }
                    Spacer() // Add spacer to push buttons to edges
                }
            )
            .sheet(isPresented: $isEditingProfile) {
                EditProfileView(name: "admin", email: "admin@gmail.com", password: "admin")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
