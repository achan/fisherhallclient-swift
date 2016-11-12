import Foundation
import Quick
import Nimble
import Spine

@testable import FisherHallClient

class BulletinEndpointSpec: QuickSpec {
	override func spec() {
		describe("findById") {
			it("returns the bulletin with the matching id") {
				let endpoint = BulletinEndpoint(withClient: FisherHallClient())

				waitUntil(timeout: 10) { done in
					endpoint
						.findById(id: 8)
						.onSuccess(callback: { (resource: BulletinResource, _, _) in
							expect(resource.id).to(equal("8"))
							expect(resource.name).to(equal("Sunday Worship Service"))
							expect(resource.serviceOrder).to(equal(" - ## Call to Worship\n - ## Praise & Worship\n - ## Announcements\n - ## Offering\n - ## Urbana Sharing\n - ## Doxology\n - ## Benediction"))
							expect(resource.bannerUrl!.absoluteString).to(equal("http://mcac.s3.amazonaws.com/bulletins/bc578a59-33f1-4319-bb43-03841f491793.jpg"))
							expect(resource.publishedAt?.timeIntervalSince1970).to(equal(1454250600))
							expect(resource.announcements?.isLoaded).to(beFalse())
							done()
						})
				}
			}
		}

		describe("latestBulletin") {
			it("returns the latest bulletin") {
				let endpoint = BulletinEndpoint(withClient: FisherHallClient())

				waitUntil(timeout: 10) { done in
					endpoint
						.getLatestBulletin()
						.onSuccess(callback: { (resource: BulletinResource, _, _) in
							// can't have useful specs until DVR is in place, this endpoint changes weekly.
							expect(resource.id).toNot(beNil())
							expect(resource.announcements?.isLoaded).to(beTrue())

							done()
						})
				}
			}
		}
	}
}
