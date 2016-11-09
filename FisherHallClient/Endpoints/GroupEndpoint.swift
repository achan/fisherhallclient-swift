import Foundation
import Spine
import BrightFutures

class GroupEndpoint {
	private static let baseUrl = "https://mcac.church/api/v1/groups"
	private let client: FisherHallClient
	
	init(withClient client: FisherHallClient) {
		self.client = client
	}

	public func findById(id: Int) -> Future<(resource: GroupResource, meta: Metadata?, jsonapi: JSONAPIData?), SpineError> {
		return client.spine.findOne(String(id), ofType: GroupResource.self)
	}
}
