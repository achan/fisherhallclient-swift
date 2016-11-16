import Foundation
import Quick
import Nimble

@testable import FisherHall

class BulletinViewModelSpec: QuickSpec {
	override func spec() {
		describe("bannerURL") {
			var subject: URL!

			beforeEach {
				let model =
					BulletinViewModel(name: "My Bulletin", publishedAt: NSDate(), bannerURL: "https://example.com/banner.png")

				subject = model.bannerURL()
			}

			it("returns a URL from the bannerURLString") {
				expect(subject).to(equal(URL(string: "https://example.com/banner.png")))
			}
		}

		describe("fromResource") {
			context("when resource doesn't contain required fields") {
				var subject: BulletinViewModel!

				beforeEach {
					subject = BulletinViewModel.fromResource(BulletinResource())
				}

				it("returns nil") {
					expect(subject).to(beNil())
				}
			}

			context("with only the required fields") {
				var resource: BulletinResource!
				var subject: BulletinViewModel!

				beforeEach {
					resource = BulletinResource()
					resource.name = "Bulletin Name"
					resource.publishedAt = NSDate(timeIntervalSince1970: 1478999629)

					subject = BulletinViewModel.fromResource(resource)
				}

				it("returns a view model with the minimum fields") {
					expect(subject.name).to(equal("Bulletin Name"))
					expect(subject.publishedAt.timeIntervalSince1970).to(equal(1478999629))
					expect(subject.bannerURLString).to(equal("https://s3.amazonaws.com/mcac/app/assets/images/theme-1920-6099a636f0f320b6d38b157909e64be6.jpg"))
					expect(subject.serviceOrder).to(equal(""))
				}
			}

			context("with all fields populated") {
				var resource: BulletinResource!
				var subject: BulletinViewModel!

				beforeEach {
					resource = BulletinResource()
					resource.name = "Bulletin Name"
					resource.publishedAt = NSDate(timeIntervalSince1970: 1478999629)
					resource.bannerUrl = NSURL(string: "http://wwww.example.com/banner.png")
					resource.serviceOrder = "My service order"

					subject = BulletinViewModel.fromResource(resource)
				}

				it("returns a view model with all fields") {
					expect(subject.name).to(equal("Bulletin Name"))
					expect(subject.publishedAt.timeIntervalSince1970).to(equal(1478999629))
					expect(subject.bannerURLString).to(equal("http://wwww.example.com/banner.png"))
					expect(subject.serviceOrder).to(equal("My service order"))
				}
			}
		}
	}
}
