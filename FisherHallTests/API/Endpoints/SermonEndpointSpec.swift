import Foundation
import Quick
import Nimble

@testable import FisherHall

class SermonEndpointSpec: QuickSpec {
	override func spec() {
		describe("findById") {
			it("returns the sermon with the matching id") {
				let endpoint = SermonEndpoint(withClient: FisherHallClient())

				waitUntil(timeout: 10) { done in
					endpoint
						.findById(id: 7)
						.onSuccess(callback: { (resource: SermonResource, _, _) in
							expect(resource.id).to(equal("7"))
							expect(resource.name).to(equal("Jesus, bread of Life"))
							expect(resource.notes).to(equal("[Annual Membership Meeting Agenda](https://s3.amazonaws.com/mcac/attachments/2016_annual_membership_meeting_agenda.pptx)"))
							expect(resource.bannerUrl).to(beNil())
							expect(resource.audioUrl!.absoluteString).to(equal("http://mcac.s3.amazonaws.com/bulletins/8c987db4-2f5b-426d-a9ba-f9bfef051430.mp3"))
							expect(resource.publishedAt?.timeIntervalSince1970).to(equal(1456671600))
							done()
						})
				}
			}
		}
	}
}
