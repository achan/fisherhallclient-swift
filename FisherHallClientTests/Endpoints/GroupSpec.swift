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
							expect(resource.about).to(equal("Welcome friends and visitors. We invite you to make MCAC your spiritual home and to worship with us every Sunday morning at 9:30am. Please let us know how we can be of help to you.\n\nThe 2016 Church theme is [Equip to Shepherd](http://mcac.church/english-service/2016-church-theme-equip-to-shepherd). *“...to equip his people for works of service, so that the body of Christ may be built up”* (Ephesians 4:12)\n\nHow can we pray for you? Let us know by [filling out a prayer request card](http://goo.gl/forms/vVNZxMsFFO)."))
							expect(resource.bannerUrl!.absoluteString).to(equal("https://mcac.s3.amazonaws.com/groups/887d6625-eb28-4de6-a158-d25bf5bf147f.jpg"))
							expect(resource.profilePictureUrl!.absoluteString).to(equal("https://mcac.s3.amazonaws.com/groups/5c7d76a8-d195-4907-951d-5b3fb00c438d.jpg"))
							expect(resource.createdAt?.timeIntervalSince1970).to(equal(1453263071))
							done()
						})
				}
			}
		}
	}
}
