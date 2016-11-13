import UIKit

class ShowBulletinViewController: UIViewController {
	private let bulletin: BulletinViewModel

	@IBOutlet weak var nameLabel: UILabel!

	required init(coder aDecoder: NSCoder) {
		print("Loading from NIB not supported.")
		abort()
	}

	required init(withBulletin bulletin: BulletinViewModel) {
		self.bulletin = bulletin
		super.init(nibName: "ShowBulletinView", bundle: Bundle.main)
	}

	override func viewDidLoad() {
		nameLabel?.text = bulletin.name
	}
}
