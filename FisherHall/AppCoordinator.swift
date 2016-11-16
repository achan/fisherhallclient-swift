import Foundation
import UIKit

class AppCoordinator: Coordinator {
	fileprivate let tabBarController: UITabBarController
	fileprivate let delegate: AppCoordinatorDelegate
	private var childCoordinators: [Coordinator] = []

	init(delegate: AppCoordinatorDelegate) {
		tabBarController = UITabBarController()
		self.delegate = delegate
	}

	public func start() {
		let latestBulletinCoordinator = LatestBulletinCoordinator(delegate: self)
		childCoordinators.append(latestBulletinCoordinator)

		latestBulletinCoordinator.start()
	}
}

extension AppCoordinator: LatestBulletinCoordinatorDelegate {
	func didCreateViewController(_ controller: ShowBulletinViewController) {
		let bulletinBarItem = UITabBarItem(
			title: R.string.localizable.tabBarItemBulletin(),
			image: R.image.bulletin(),
			selectedImage: R.image.bulletinSelected()
		)

		controller.tabBarItem = bulletinBarItem
		tabBarController.setViewControllers([controller], animated: true)

		delegate.didCreateRootViewController(tabBarController)
	}
}

protocol AppCoordinatorDelegate {
	func didCreateRootViewController(_ controller: UIViewController)
}
