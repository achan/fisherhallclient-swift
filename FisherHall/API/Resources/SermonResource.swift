import Foundation
import Spine

class SermonResource: Resource {
	var name: String?
	var notes: String?
	var speaker: String?
	var series: String?
	var bannerUrl: NSURL?
	var audioUrl: NSURL?
	var publishedAt: NSDate?

	override class var resourceType: ResourceType {
		return "sermons"
	}

	override class var fields: [Field] {
		return fieldsFromDictionary([
			"name": Attribute(),
			"notes": Attribute(),
			"speaker": Attribute(),
			"series": Attribute(),
			"bannerUrl": URLAttribute(),
			"audioUrl": URLAttribute(),
			"publishedAt": DateAttribute(format: "yyyy-MM-dd'T'HH:mm:ssZZZZZ")
		])
	}
}
