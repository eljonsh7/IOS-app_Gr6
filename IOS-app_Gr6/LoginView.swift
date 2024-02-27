import UIKit
import SwiftUI
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet var email:UITextField!
    @IBOutlet var password:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        FirebaseApp.configure()
    }
    
    @IBAction func loginAction(sender: UIButton) {
        Task { @MainActor in
            guard let usrmail = email.text, let pwd = password.text else {
                showAlert(message: "Email or password is empty")
                return
            }
            
            do {
                let authDataResults = try await Auth.auth().signIn(withEmail: usrmail, password: pwd)
                print("User signed in successfully.")
                let mainView = MainView()
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let sceneDelegate = windowScene.delegate as? SceneDelegate {
                    sceneDelegate.window?.rootViewController = UIHostingController(rootView: mainView)
                }
            } catch {
                showAlert(message: "Invalid credentials!")
            }
        }
    }

    func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }

}
