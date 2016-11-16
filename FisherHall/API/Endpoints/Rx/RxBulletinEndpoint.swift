import Foundation
import RxSwift

class RxBulletinEndpoint {
	private let endpoint: BulletinEndpoint

	init(withClient client: FisherHallClient) {
		endpoint = BulletinEndpoint(withClient: client)
	}

	public func getLatestBulletin() -> Observable<BulletinResource> {
		return Observable.create { observer in
			self.endpoint.getLatestBulletin().onSuccess { resource, _, _ in
				observer.on(.next(resource))
				observer.on(.completed)
			}

			return Disposables.create()
		}
	}
}
