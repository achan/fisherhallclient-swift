import Foundation
import UIKit
import BrightFutures
import Spine

class LatestBulletinCoordinator: Coordinator {
	private let delegate: LatestBulletinCoordinatorDelegate

	init(delegate: LatestBulletinCoordinatorDelegate) {
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

protocol LatestBulletinCoordinatorDelegate {
	func didCreateViewController(_ controller: ShowBulletinViewController)
}
