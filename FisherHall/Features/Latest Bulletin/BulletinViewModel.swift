import Foundation

class BulletinViewModel {
	let name: String
	let publishedAt: NSDate
	let bannerURLString: String
	var serviceOrder: String

	init(name: String, publishedAt: NSDate, bannerURL: String? = nil, serviceOrder: String? = nil) {
		self.name = name
		self.publishedAt = publishedAt
		bannerURLString = bannerURL ?? "https://s3.amazonaws.com/mcac/app/assets/images/theme-1920-6099a636f0f320b6d38b157909e64be6.jpg"
		self.serviceOrder = serviceOrder ?? ""
	}

	public static func fromResource(resource: BulletinResource) -> BulletinViewModel? {
		guard let name = resource.name, let publishedAt = resource.publishedAt else {
			return nil
		}

		return BulletinViewModel(
			name: name,
			publishedAt: publishedAt,
			bannerURL: resource.bannerUrl?.absoluteString,
			serviceOrder: resource.serviceOrder
		)
	}

	public func bannerURL() -> URL? {
		return URL(string: bannerURLString)
	}
}
