import SwiftUI
import UIKit

struct EditProfileView: View {
    @State private var firstName: String
    @State private var lastName: String
    @State private var showingAlert = false

    init(firstName: String, lastName: String, profilePic: String) {
        _firstName = State(initialValue: firstName)
        _lastName = State(initialValue: lastName)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile Info")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
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
        UserDefaults.standard.set(firstName, forKey: "loggedInUserFirstName")
        UserDefaults.standard.set(lastName, forKey: "loggedInUserLastName")
        showingAlert = true
    }

}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(firstName: "John", lastName: "Doe", profilePic: "")
    }
}
