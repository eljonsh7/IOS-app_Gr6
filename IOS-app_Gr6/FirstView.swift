import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                Spacer()
                
                HStack {
                    Spacer()
                    NavigationLink(destination: LoginView()) {
                        Text("Proceed to login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                Text("or")
                
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                        .frame(width: 200, height: 30)
                        .cornerRadius(10)
                }
            }
        }
    }
}


#Preview {
    FirstView()
}
