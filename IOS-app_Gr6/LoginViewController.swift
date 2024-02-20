//
//  LoginViewController.swift
//  IOS-app_Gr6
//
//  Created by Beslind Mema on 15.2.24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var username:UITextField!
    @IBOutlet var password:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(sender: UIButton) {
        var usr:String?
        usr = username.text
        
        var pwd:String?
        pwd = password.text
        
        if(usr == "admin" && pwd == "admin") {
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
