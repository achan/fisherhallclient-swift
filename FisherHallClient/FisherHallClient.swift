import Foundation
import Spine

class FisherHallClient {
	private let baseURL = URL(string: "https://mcac.church/api/v1")!
	private let _spine: Spine;

	var spine: Spine {
		return _spine;
	}

	public convenience init() {
		self.init(withNetworkClient: HTTPClient())
	}

	public convenience init(withSession session: URLSession) {
		self.init(withNetworkClient: HTTPClient(session: session))
	}

	private init(withNetworkClient networkClient: NetworkClient) {
		_spine = Spine(baseURL: baseURL, networkClient: networkClient)
		_spine.registerResource(GroupResource.self)
		_spine.registerResource(BulletinResource.self)
	}
}
