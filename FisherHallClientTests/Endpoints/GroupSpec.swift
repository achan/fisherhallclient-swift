import Foundation
import Quick
import Nimble
import Spine

@testable import FisherHallClient

class GroupSpec: QuickSpec {
	override func spec() {
		describe("findById") {
			it("returns the group with the matching id") {
				let endpoint = Group(withClient: FisherHallClient())
				
				waitUntil(timeout: 10) { done in
					endpoint
						.findById(id: 1)
						.onSuccess(callback: { (resource: GroupResource, _, _) in
							expect(resource.id).to(equal("1"))
							expect(resource.name).to(equal("English Service"))
							expect(resource.meetDetails).to(equal("Sundays at 9:30am"))
							expect(resource.shortDescription).to(equal("Worship service for the English congregation"))
							expect(resource.targetAudience).to(equal("Members and seekers"))
							expect(resource.slug).to(equal("english-service"))

							done()
						})
				}
			}
		}
	}
}
