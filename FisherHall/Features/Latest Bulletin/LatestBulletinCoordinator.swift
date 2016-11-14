import Foundation
import UIKit

class LatestBulletinCoordinator: Coordinator {
	private let controller: UITabBarController
	private let delegate: LatestBulletinCoordinatorDelegate

	init(withTabBarController controller: UITabBarController, delegate: LatestBulletinCoordinatorDelegate = NoOpLatestBulletinCoordinatorDelegate()) {
		self.controller = controller
		self.delegate = delegate
	}

	public func start() {
		BulletinEndpoint(withClient: FisherHallClient())
			.getLatestBulletin()
			.onSuccess { [weak self] bulletinResource, _, _ in
				guard
					let weakSelf = self,
					let bulletin = BulletinViewModel.fromResource(resource: bulletinResource)
					else { return }

				weakSelf.delegate
					.didCreateViewController(ShowBulletinViewController(withBulletin: bulletin))
			}
	}
}

private struct NoOpLatestBulletinCoordinatorDelegate: LatestBulletinCoordinatorDelegate {
	func didCreateViewController(_ controller: ShowBulletinViewController) {
	}
}
