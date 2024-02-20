import UIKit
import SwiftUI

class WelcomeView: UIViewController {

    override func viewDidLoad() {
        if "admin" != "admin" {
            super.viewDidLoad()
        } else {
            let mainView = MainView()
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = UIHostingController(rootView: mainView)
            }
        }
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
