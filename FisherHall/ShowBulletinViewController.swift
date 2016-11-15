import UIKit
import BrightFutures
import Spine

class ShowBulletinViewController: UIViewController {
	private var bulletin: BulletinViewModel?

	@IBOutlet weak var nameLabel: UILabel!

	required init(coder aDecoder: NSCoder) {
		print("Loading from NIB not supported.")
		abort()
	}

	required init(withBulletinFuture bulletinFuture: Future<BulletinViewModel, SpineError>) {
		super.init(nibName: R.nib.showBulletinView.name, bundle: Bundle.main)

		bulletinFuture.onSuccess { [weak self] bulletin in
			guard let weakSelf = self else { return }

			weakSelf.updateBulletin(bulletin)
		}
	}

	func updateBulletin(_ bulletin: BulletinViewModel) {
		self.bulletin = bulletin

		guard let bulletin = self.bulletin else { return }
		nameLabel?.text = bulletin.name
	}
}
