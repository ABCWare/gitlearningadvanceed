//
//  UserDetailsViewController.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 12.05.21.
//

import Kingfisher
import MapKit
import MessageUI
import UIKit

import RxCocoa
import RxFlow
import RxSwift

// MARK: - UserDetailsViewController

final class UserDetailsViewController: BaseViewController {
	// MARK: - MVVM

	var viewModel: UserDetailsViewModel!
	override var stepper: Stepper! { viewModel }

	// MARK: - Outlets

	@IBOutlet var avatarImageView: UIImageView! {
		didSet {  avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2 }
	}
	@IBOutlet fileprivate var ageRow: UserDetailRowView!
	@IBOutlet fileprivate var genderRow: UserDetailRowView!
	@IBOutlet fileprivate var emailRow: UserDetailRowView! { didSet { emailRow.delegate = viewModel }}
	@IBOutlet fileprivate var phoneRow: UserDetailRowView! { didSet { phoneRow.delegate = viewModel }}
	@IBOutlet fileprivate var addressRow: UserDetailRowView!
	@IBOutlet fileprivate var mapView: MKMapView!

	lazy var actionButtonItem: UIBarButtonItem = {
		let barButtonItem = UIBarButtonItem()
		navigationItem.rightBarButtonItem = barButtonItem
		return barButtonItem
	}()

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		doBindings()
	}

	// MARK: - Reactive

	private func doBindings() {
		viewModel.user
			.bind(to: rx.user)
			.disposed(by: disposeBag)

		viewModel.isSaved
			.map { isSaved in isSaved ? .heartFill: .heart }
			.bind(to: actionButtonItem.rx.image)
			.disposed(by: disposeBag)

		actionButtonItem.rx.tap
			.bind(to: viewModel.actionTapped)
			.disposed(by: disposeBag)

		viewModel.action
			.withLatestFrom(viewModel.user) { ($0, $1) }
			.subscribe(onNext: { [weak self] action, user in
				switch action {
				case .phone: self?.callTo(phoneNumber: user.phone)
				case .email: self?.emailTo(email: user.email)
				}
			})
			.disposed(by: disposeBag)
	}

	func callTo(phoneNumber: String) {
		if !phoneNumber.isEmpty, let encoded = phoneNumber.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
			if let url = NSURL(string: "tel://" + encoded) {
				if UIApplication.shared.canOpenURL(url as URL) {
					UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
				}
			}
		}
	}

	func emailTo(email: String) {
		if MFMailComposeViewController.canSendMail() {
			let controller = MFMailComposeViewController()
			controller.mailComposeDelegate = self
			controller.setToRecipients([email])
			present(controller, animated: true)
		} else {
			fatalError()
		}
	}
}

// MARK: MFMailComposeViewControllerDelega