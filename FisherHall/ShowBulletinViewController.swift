import UIKit
import BrightFutures
import Spine

class ShowBulletinViewController: UIViewController {
	@IBOutlet weak var nameLabel: UILabel!

	private var bulletin: BulletinViewModel? {
		didSet {
			if let bulletin = self.bulletin {
				self.updateUI(withBulletin: bulletin)
			}
		}
	}

	required init(coder aDecoder: NSCoder) {
		print("Loading from NIB not supported.")
		abort()
	}

	required init(withBulletinFuture bulletinFuture: Future<BulletinViewModel, SpineError>) {
		super.init(nibName: R.nib.showBulletinView.name, bundle: Bundle.main)

		bulletinFuture.onSuccess { [weak self] bulletin in
			self?.bulletin = bulletin
		}
	}

	func updateUI(withBulletin bulletin: BulletinViewModel) {
		nameLabel?.text = bulletin.name
	}
}
