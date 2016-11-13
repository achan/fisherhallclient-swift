import Foundation
import UIKit

class AppCoordinator {
	private let controller: UIViewController

	init(withNavigationController controller: UIViewController) {
		self.controller = controller
	}

	public func start() {
		LatestBulletinCoordinator(withNavigationController: controller).start()
	}
}
