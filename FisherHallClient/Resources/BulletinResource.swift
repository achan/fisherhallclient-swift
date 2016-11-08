import Foundation
import Spine

class BulletinResource: Resource {
	var name: String?
	var serviceOrder: String?
	var bannerUrl: NSURL?
	var publishedAt: NSDate?

	override class var resourceType: ResourceType {
		return "bulletins"
	}

	override class var fields: [Field] {
		return fieldsFromDictionary([
			"name": Attribute(),
			"serviceOrder": Attribute(),
			"bannerUrl": URLAttribute(),
			"publishedAt": DateAttribute(format: "yyyy-MM-dd'T'HH:mm:ssZZZZZ")
			])
	}
}
