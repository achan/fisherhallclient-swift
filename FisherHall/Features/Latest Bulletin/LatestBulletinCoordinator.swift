import Foundation
import UIKit

class LatestBulletinCoordinator: Coordinator {
	private let controller: UIViewController

	init(withNavigationController controller: UIViewController) {
		self.controller = controller
	}

	public func start() {
		BulletinEndpoint(withClient: FisherHallClient())
			.getLatestBulletin()
			.onSuccess { [weak self] bulletinResource, _, _ in
				guard
					let weakSelf = self,
					let bulletin = BulletinViewModel.fromResource(resource: bulletinResource)
					else { return }

				weakSelf
					.controller
					.present(ShowBulletinViewController(withBulletin: bulletin), animated: true)
			}
	}
}
