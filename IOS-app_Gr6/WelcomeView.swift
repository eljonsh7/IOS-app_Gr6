import UIKit
import SwiftUI

// Assuming isLoggedIn is declared somewhere accessible to WelcomeView
var isLoggedIn = false

class WelcomeView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if isLoggedIn {
            let mainView = MainView()
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = UIHostingController(rootView: mainView)
            }
        }
    }
    
    func loggedIn() {
        isLoggedIn = true
    }
    
    func loggedOut() {
        isLoggedIn = false
    }
}

struct WelcomeViewWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return WelcomeView()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the view controller if needed
    }
}
