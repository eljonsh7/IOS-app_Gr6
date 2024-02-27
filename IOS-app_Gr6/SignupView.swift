import UIKit
import SwiftUI
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet var name:UITextField!
    @IBOutlet var email:UITextField!
    @IBOutlet var password:UITextField!
    @IBOutlet var password2:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        password2.isSecureTextEntry = true
    }
    
    @IBAction func signupAction(sender: UIButton) {
        Task { @MainActor in
            guard let usr = name.text, let mail = email.text, let pwd = password.text, let pwd2 = password2.text else {
                showAlert(message: "Please fill out all fields.")
                return
            }
            
            if pwd == pwd2 {
                do {
                    try await createUserAndSignIn(name: usr, email: mail, password: pwd)
                    let mainView = MainView()
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let sceneDelegate = windowScene.delegate as? SceneDelegate {
                        sceneDelegate.window?.rootViewController = UIHostingController(rootView: mainView)
                    }
                } catch {
                    showAlert(message: "Error signing up: \(error.localizedDescription)")
                }
            } else {
                showAlert(message: "Passwords are not equal.")
            }
        }
    }

    func createUserAndSignIn(name: String, email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        try await Auth.auth().signIn(with: credential)
    }

    func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }

}
