import UIKit
import SwiftUI

var isLoggedIn = true

extension WelcomeView: ProfileViewDelegate {
    func didLogout() {
        isLoggedIn = false
        // Show WelcomeView again
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = UIHostingController(rootView: WelcomeViewWrapper())
        }
    }
}

class WelcomeView: UIViewController {
    override func viewDidLoad() {
        if isLoggedIn {
            let mainView = MainView()
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = UIHostingController(rootView: mainView)
            }
        } else {
            super.viewDidLoad()
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
