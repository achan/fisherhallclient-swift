import Foundation
import Spine

class GroupResource: Resource {
	var about: String?
	var bannerUrl: NSURL?
	var meetDetails: String?
	var name: String?
	var profilePictureUrl: NSURL?
	var shortDescription: String?
	var slug: String?
	var targetAudience: String?
	var createdAt: NSDate?
	var createdAtIso8601: String?

	override class var resourceType: ResourceType {
		return "groups"
	}

	override class var fields: [Field] {
		return fieldsFromDictionary([
			"about": Attribute(),
			"bannerUrl": URLAttribute(),
			"meetDetails": Attribute(),
			"name": Attribute(),
			"profilePictureUrl": URLAttribute(),
			"shortDescription": Attribute(),
			"slug": Attribute(),
			"targetAudience": Attribute(),
			"createdAt": DateAttribute(format: "yyyy-MM-dd'T'HH:mm:ssZZZZZ")
		])
	}
}
