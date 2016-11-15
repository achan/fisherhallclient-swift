import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppCoordinatorDelegate {
	var window: UIWindow?
	var coordinator: AppCoordinator?

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		coordinator = AppCoordinator(delegate: self)
		coordinator!.start()

		return true
	}

	func didCreateRootViewController(_ controller: UIViewController) {
		guard let window = self.window else { return }

		window.rootViewController = controller
		window.makeKeyAndVisible()
	}
}
