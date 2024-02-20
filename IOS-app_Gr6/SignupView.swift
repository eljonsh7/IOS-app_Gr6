import UIKit
import SwiftUI

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
        var usr:String?
        usr = name.text
        
        var mail:String?
        mail = email.text
        
        var pwd:String?
        pwd = password.text
        
        var pwd2:String?
        pwd2 = password2.text
        
        if(usr != "" && mail != "" && pwd != "" && pwd2 != "") {
            if(pwd == pwd2) {
                print("Sign up successful!")
                let mainView = MainView()
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let sceneDelegate = windowScene.delegate as? SceneDelegate {
                    sceneDelegate.window?.rootViewController = UIHostingController(rootView: mainView)
                }
            } else {
                print("Passwords are not equal.")
            }
        } else {
            print("Please fill out all fields.")
        }
    }
}
