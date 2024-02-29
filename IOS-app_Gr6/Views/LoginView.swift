import SwiftUI
import UIKit

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                TextField("Username", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(height: 50)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(height: 50)
                
                Button(action: {
                    if !email.contains("@") {
                        showAlert(message: "Invalid email format.")
                    } else {
                        guard let user = DBHelper.shared.loginUser(email: email, password: password) else {
                            showAlert(message: "User not found.")
                            return
                        }
                        UserDefaults.standard.set(email, forKey: "loggedInUserEmail")
                        if let firstName = user.firstName {
                            UserDefaults.standard.set(firstName, forKey: "loggedInUserFirstName")
                        }
                        if let lastName = user.lastName {
                            UserDefaults.standard.set(lastName, forKey: "loggedInUserLastName")
                        }
                        if let userId = user.id {
                            UserDefaults.standard.set(userId.uuidString, forKey: "loggedInUserId")
                        }
                        isLoggedIn = true
                    }
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .font(.headline)
                }
                .padding()


                
                Spacer()
                
                HStack {
                    Spacer()
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                            .frame(width: 200, height: 50)
                    }
                    Spacer()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
        .background(
            NavigationLink(
                destination: MainView(),
                isActive: $isLoggedIn,
                label: { EmptyView() }
            ).hidden()
        )
        .navigationBarBackButtonHidden(true)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


#Preview {
    LoginView()
}
