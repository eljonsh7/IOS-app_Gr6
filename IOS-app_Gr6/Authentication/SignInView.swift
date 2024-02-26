import SwiftUI

//@MainActor
//final class SignInViewModel {
//    @Published var email = ""
//    @Published var password = ""
//    
//    func signIn() {
//        guard !email.isEmpty, !password.isEmpty else {
//            print("No email or password found.")
//            return
//        }
//        
//        Task {
//            do {
//                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
//                print("Success")
//                print(returnedUserData)
//            } catch {
//                print("Error: \(error)")
//            }
//        }
//    }
//}

struct SigninView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("Log in")
                .font(.title)
                .padding(.bottom, 20)
            TextField("Username", text: $email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5.0)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5.0)
                .padding(.horizontal)
            
            Button(action: {
                
                    guard !email.isEmpty, !password.isEmpty else {
                        print("No email or password found.")
                        return
                    }
                    
                    Task {
                        do {
                            let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                            print("Success")
                            print(returnedUserData)
                        } catch {
                            print("Error: \(error)")
                        }
                    }
            }) {
                Text("Sign In")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(5.0)
            }
            .padding(.horizontal)
            
            Spacer()
            
            HStack {
                Text("Don't have an account?")
                Button(action: {
                    // Perform sign up action here
                    print("Sign Up tapped")
                }) {
                    Text("Sign Up")
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
