import Foundation
import UIKit

class AppCoordinator: Coordinator, LatestBulletinCoordinatorDelegate {
	private let tabBarController: UITabBarController
	private var childCoordinators: [Coordinator] = []
	private var delegate: AppCoordinatorDelegate?

	init(delegate: AppCoordinatorDelegate? = nil) {
		tabBarController = UITabBarController()
		self.delegate = delegate
	}

	public func start() {
		let latestBulletinCoordinator =
			LatestBulletinCoordinator(withTabBarController: tabBarController, delegate: self)
		childCoordinators.append(latestBulletinCoordinator)

		latestBulletinCoordinator.start()
	}

	func didCreateViewController(_ controller: ShowBulletinViewController) {
		let bulletinBarItem = UITabBarItem(title: "Bulletin", image: nil, selectedImage: nil)
		controller.tabBarItem = bulletinBarItem
		tabBarController.setViewControllers([controller], animated: true)

		delegate?.didCreateRootViewController(tabBarController)
	}
}

protocol AppCoordinatorDelegate {
	func didCreateRootViewController(_ controller: UIViewController)
}
