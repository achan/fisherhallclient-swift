import Foundation
import Spine
import BrightFutures

class AnnouncementEndpoint {
	private static let baseUrl = "https://mcac.church/api/v1/announcements"
	private let client: FisherHallClient

	init(withClient client: FisherHallClient) {
		self.client = client
	}

	public func findById(id: Int)
		-> Future<(resource: AnnouncementResource, meta: Metadata?, jsonapi: JSONAPIData?), SpineError> {
		return client.spine.findOne(String(id), ofType: AnnouncementResource.self)
	}
}
