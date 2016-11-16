import UIKit
import BrightFutures
import Spine
import RxSwift

class ShowBulletinViewController: UIViewController {
	@IBOutlet weak var nameLabel: UILabel!

	private let disposeBag = DisposeBag()

	required init(coder aDecoder: NSCoder) {
		print("Loading from NIB not supported.")
		abort()
	}

	required init(withBulletinObservable bulletinObserver: Observable<BulletinViewModel>) {
		super.init(nibName: R.nib.showBulletinView.name, bundle: Bundle.main)

		bulletinObserver
			.subscribe(onNext: { self.updateUI(withBulletin: $0) })
			.addDisposableTo(disposeBag)
	}

	private func updateUI(withBulletin bulletin: BulletinViewModel) {
		nameLabel?.text = bulletin.name
	}
}
