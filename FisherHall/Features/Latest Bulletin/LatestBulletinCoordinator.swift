import Foundation
import UIKit
import BrightFutures
import Spine

class LatestBulletinCoordinator: Coordinator {
	private let controller: UITabBarController
	private let delegate: LatestBulletinCoordinatorDelegate

	init(
		withTabBarController controller: UITabBarController,
		delegate: LatestBulletinCoordinatorDelegate) {
		self.controller = controller
		self.delegate = delegate
	}

	public func start() {
		let bulletinFuture = BulletinEndpoint(withClient: FisherHallClient())
			.getLatestBulletin()
			.flatMap { response in self.buildViewModelFuture(fromResource: response.resource) }

		let showBulletinController = ShowBulletinViewController(withBulletinFuture: bulletinFuture)
		self.delegate.didCreateViewController(showBulletinController)
	}

	private func buildViewModelFuture(fromResource resource: BulletinResource)
		-> Future<BulletinViewModel, SpineError> {
		if let bulletinViewModel = BulletinViewModel.fromResource(resource: resource) {
			return Future(value: bulletinViewModel)
		}

		return Future(error: SpineError.resourceNotFound)
	}
}
