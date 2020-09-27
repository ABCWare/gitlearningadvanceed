
//
//  RemoteUsersViewController.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import Reusable
import UIKit

import RxFlow
import RxSwift

// MARK: - RemoteUsersViewController

final class RemoteUsersViewController: BaseViewController {
	// MARK: - MVVM

	var viewModel: RemoteUsersViewModel!
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