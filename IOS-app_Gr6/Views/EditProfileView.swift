import SwiftUI
struct EditProfileView: View {
    @State private var name: String
    @State private var email: String
    @State private var password: String
    @State private var oldPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var showingAlert = false
    
    init(name: String, email: String, password: String) {
        _name = State(initialValue: name)
        _email = State(initialValue: email)
        _password = State(initialValue: password)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile Picture")) {
                    Button(action: {
                    }) {
                        Text("Change Profile Picture")
                    }
                }
                
                Section(header: Text("Profile Info")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                }
                
                Section(header: Text("Change Password")) {
                    SecureField("Old Password", text: $oldPassword)
                    SecureField("New Password", text: $newPassword)
                    SecureField("Confirm Password", text: $confirmPassword)
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarItems(trailing:
                Button(action: {
                    saveChanges()
                }) {
                    Text("Save")
                }
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Changes Saved"), message: Text("Your profile has been updated."), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func saveChanges() {
        showingAlert = true
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(name: "John Doe", email: "john@example.com", password: "password")
    }
}
