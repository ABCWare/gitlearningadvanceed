
//
//  LocalUsersViewController.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import UIKit

import RxFlow
import RxSwift

// MARK: - LocalUsersViewController

final class LocalUsersViewController: BaseViewController {
	// MARK: - MVVM

	var viewModel: LocalUsersViewModel!
	override var stepper: Stepper! { viewModel }

	// MARK: - Outlets

	@IBOutlet private var tableView: UITableView! {
		didSet { configureTableView() }
	}

	private func configureTableView() {
		tableView.separatorInset = .zero
		tableView.tableFooterView = UIView()
		tableView.register(cellType: UserTableViewCell.self)
		tableView.rx.setDelegate(self).disposed(by: disposeBag)
	}

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		configureSearchController()
		doBindings()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		navigationItem.searchController?.isActive = false
		viewModel.refresh.accept(())
	}

	// MARK: - Search

	private var searchBar: UISearchBar? {
		navigationItem.searchController?.searchBar
	}

	private func configureSearchController() {
		let searchController = UISearchController(searchResultsController: nil)
		searchController.searchBar.barTintColor = .main1
		searchController.searchBar.placeholder = "Search by name, email, phone, location"
		searchController.automaticallyShowsCancelButton = false
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.enablesReturnKeyAutomatically = true
		searchController.hidesNavigationBarDuringPresentation = false
		navigationItem.searchController = searchController