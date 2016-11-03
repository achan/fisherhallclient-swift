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

	override class var resourceType: ResourceType {
		return "groups"
	}

	override class var fields: [Field] {
		return fieldsFromDictionary([
			"about": Attribute(),
			"bannerUrl": URLAttribute().serializeAs("banner-url"),
			"meetDetails": Attribute().serializeAs("meet-details"),
			"name": Attribute(),
			"profilePictureUrl": URLAttribute().serializeAs("profile-picture-url"),
			"shortDescription": Attribute().serializeAs("short-description"),
			"slug": Attribute(),
			"targetAudience": Attribute().serializeAs("target-audience"),
			"createdAt": DateAttribute().serializeAs("created-at")
		])
	}
}
