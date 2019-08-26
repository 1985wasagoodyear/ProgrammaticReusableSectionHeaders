import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = self.window ?? UIWindow(frame: UIScreen.main.bounds)
        let vc = MyViewController()
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        return true
    }
}
