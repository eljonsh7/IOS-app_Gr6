import SwiftUI

struct SignUpView: View {
    @State private var fullname: String = ""
    @State private var email: String = ""
    @State private var password1: String = ""
    @State private var password2: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToMainView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                TextField("Username", text: $fullname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(height: 50)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(height: 50)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(height: 50)
                
                SecureField("Confirm Password", text: $password2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(height: 50)
                
                Button(action: {
                    self.signUp()
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .font(.headline)
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Sign Up")
        }
        .background(
            NavigationLink(
                destination: MainView(),
                isActive: $navigateToMainView,
                label: { EmptyView() }
            ).hidden()
        )
    }
    
    private func signUp() {
        if fullname.isEmpty || email.isEmpty || password1.isEmpty || password2.isEmpty {
            alertMessage = "Please fill in all fields."
            showAlert.toggle()
            return
        }
        
        if password1 != password2 {
            alertMessage = "Passwords do not match."
            showAlert.toggle()
            return
        }
        
        if !email.contains("@") {
            alertMessage = "Invalid email format."
            showAlert.toggle()
            return
        }
        
        let components = fullname.split(separator: " ")
        guard let firstName = components.first, let lastName = components.last else {
            alertMessage = "Invalid full name."
            showAlert.toggle()
            return
        }
        
        DBHelper.shared.addUser(firstName: String(firstName), lastName: String(lastName), email: email, password: password1, profilePic: "")
        navigateToMainView = true
    }

}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

#Preview {
    SignUpView()
}
