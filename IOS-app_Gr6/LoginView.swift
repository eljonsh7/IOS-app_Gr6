import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    
    @IBOutlet var email:UITextField!
    @IBOutlet var password:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
    }
    
    @IBAction func loginAction(sender: UIButton) {
        var usrmail:String?
        usrmail = email.text
        
        var pwd:String?
        pwd = password.text
        if usrmail == "admin" && pwd == "admin" {
            print("Successful login")
            let mainView = MainView()
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = UIHostingController(rootView: mainView)
            }
        } else {
            print("Invalid credentials")
        }
    }
}
