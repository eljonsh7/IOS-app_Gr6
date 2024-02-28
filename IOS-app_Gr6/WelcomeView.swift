import UIKit
import SwiftUI

class WelcomeView: UIViewController {
    override func viewDidLoad() {
            let firstView = FirstView()
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = UIHostingController(rootView: firstView)
            }
    }
}
