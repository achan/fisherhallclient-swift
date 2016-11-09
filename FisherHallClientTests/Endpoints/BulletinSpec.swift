import Foundation
import Quick
import Nimble
import Spine

@testable import FisherHallClient

class BulletinSpec: QuickSpec {
	override func spec() {
		describe("findById") {
			it("returns the bulletin with the matching id") {
				let endpoint = Bulletin(withClient: FisherHallClient())

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
				let endpoint = Bulletin(withClient: FisherHallClient())

				waitUntil(timeout: 10) { done in
					endpoint
						.getLatestBulletin()
						.onSuccess(callback: { (resource: BulletinResource, _, _) in
							expect(resource.id).to(equal("48"))
							expect(resource.name).to(equal("Holy Communion Sunday Worship Service"))
							expect(resource.serviceOrder).to(equal(" - ## Call to Worship\n - ## Praise & Worship\n - ## [Announcements](#announcements)\n - ## Offering\n - ## Holy Communion\n - ## Sermon\n   The Art of Shepherding  \n   Acts 11:22-26  \n   Rev. Thomas Chan\n - ## Doxology\n - ## Benediction"))
							expect(resource.bannerUrl).to(beNil())
							expect(resource.publishedAt?.timeIntervalSince1970).to(equal(1478442600))

							expect(resource.announcements?.resources.map { Int($0.id!) })
								.to(equal([443, 442, 441, 440, 439, 436, 438, 437, 435]))

							let firstAnnouncement = resource.announcements!.resources[0] as! AnnouncementResource
							expect(firstAnnouncement.desc).to(equal("If you brought in non-perishable goods, please leave them at the back of the sanctuary."))
							expect(firstAnnouncement.position).to(equal(9))

							done()
						})
				}
			}
		}
	}
}
