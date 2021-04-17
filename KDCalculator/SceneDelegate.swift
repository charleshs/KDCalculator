import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = CalculatorViewController()
        window?.makeKeyAndVisible()

        print("Launched by SceneDelegate.")

        (UIApplication.shared.delegate as? AppDelegate)?.window = window
    }
}
