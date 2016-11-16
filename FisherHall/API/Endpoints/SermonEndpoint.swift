import Foundation
import Spine
import BrightFutures

class SermonEndpoint {
	private static let baseUrl = "https://mcac.church/api/v1/sermons"
	private let client: FisherHallClient

	init(withClient client: FisherHallClient) {
		self.client = client
	}

	public func findById(id: Int) -> Future<(resource: SermonResource, meta: Metadata?, jsonapi: JSONAPIData?), SpineError> {
		return client.spine.findOne(String(id), ofType: SermonResource.self)
	}
}
