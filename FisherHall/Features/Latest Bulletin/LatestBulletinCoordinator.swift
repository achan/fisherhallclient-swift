import Foundation
import UIKit
import RxSwift

class LatestBulletinCoordinator: Coordinator {
	private let delegate: LatestBulletinCoordinatorDelegate

	init(delegate: LatestBulletinCoordinatorDelegate) {
		self.delegate = delegate
	}

	public func start() {
		let bulletinObservable =
			RxBulletinEndpoint(withClient: FisherHallClient())
				.getLatestBulletin()
				.flatMap { response in self.createObservable(fromResource: response) }

		let showBulletinController =
			ShowBulletinViewController(withBulletinObservable: bulletinObservable)

		self.delegate.didCreateViewController(showBulletinController)
	}

	private func createObservable(fromResource resource: BulletinResource)
		-> Observable<BulletinViewModel> {
		return Observable.create { observer in
			if let bulletin = BulletinViewModel.fromResource(resource) {
				observer.onNext(bulletin)
			} else {
				observer.onError(AppError.resourceToViewModelConversionError)
			}

			observer.onCompleted()
			return Disposables.create()
		}
	}
}

protocol LatestBulletinCoordinatorDelegate {
	func didCreateViewController(_ controller: ShowBulletinViewController)
}
