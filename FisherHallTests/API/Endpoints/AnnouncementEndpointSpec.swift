import Foundation
import Quick
import Nimble
import Spine

@testable import FisherHall

class AnnouncementEndpointSpec: QuickSpec {
	override func spec() {
		describe("findById") {
			it("returns the announcement with the matching id") {
				let endpoint = AnnouncementEndpoint(withClient: FisherHallClient())

				waitUntil(timeout: 10) { done in
					endpoint
						.findById(id: 1)
						.onSuccess(callback: { (resource: AnnouncementResource, _, _) in
							expect(resource.id).to(equal("1"))
							expect(resource.desc).to(equal("**Welcome friends and visitors.** We invite you to make MCAC your spiritual home. Please let us know how we can be of help to you."))
							expect(resource.position).to(equal(1))
							done()
						})
				}
			}
		}
	}
}
