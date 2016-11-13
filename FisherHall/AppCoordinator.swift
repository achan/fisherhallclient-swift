import Foundation
import UIKit

class AppCoordinator: Coordinator {
	private let controller: UIViewController
	private var childCoordinators: [Coordinator] = []

	init(withNavigationController controller: UIViewController) {
		self.controller = controller
	}

	public func start() {
		let latestBulletinCoordinator = LatestBulletinCoordinator(withNavigationController: controller)
		childCoordinators.append(latestBulletinCoordinator)

		latestBulletinCoordinator.start()
	}
}
