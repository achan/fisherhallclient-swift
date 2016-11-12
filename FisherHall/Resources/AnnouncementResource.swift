import Foundation
import Spine

class AnnouncementResource: Resource {
	var desc: String?
	var position: NSNumber?
	var externalLink: NSURL?

	override class var resourceType: ResourceType {
		return "announcements"
	}

	override class var fields: [Field] {
		return fieldsFromDictionary([
			"desc": Attribute().serializeAs("description"),
			"position": Attribute(),
			"externalLink": URLAttribute().serializeAs("url")
		])
	}
}
