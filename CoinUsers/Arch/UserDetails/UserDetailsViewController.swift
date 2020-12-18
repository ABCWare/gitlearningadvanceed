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
		navigationItem.rightBarB