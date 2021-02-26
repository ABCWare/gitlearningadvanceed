//
//  BaseViewController.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import Reusable
import UIKit

import RxFlow
import RxRelay
import RxSwift

class BaseViewController: UIViewController, StoryboardBased {
	let disposeBag = DisposeBag()
	var stepper: Stepper! { nil }
	let error = PublishRelay<AlertableError>()

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupNavigationBar()
		doBindings()
	}

	private func setupNavigationBar() {
		let backItem = UIBarButtonItem