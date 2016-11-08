import Foundation
import Spine
import BrightFutures

class Bulletin {
	private static let baseUrl = "https://mcac.church/api/v1/bulletins"

	let client: FisherHallClient

	init(withClient client: FisherHallClient) {
		self.client = client
	}

	public func findById(id: Int)
		-> Future<(resource: BulletinResource, meta: Metadata?, jsonapi: JSONAPIData?), SpineError> {
		return client.spine.findOne(String(id), ofType: BulletinResource.self)
	}

	public func getLatestBulletin() -> Future<(resource: BulletinResource, meta: Metadata?, jsonapi: JSONAPIData?), SpineError> {
		let query =
			Query(resourceType: BulletinResource.self, path: "https://mcac.church/api/v1/sunday")
		return client.spine.findOne(query)
	}
}
