
//
//  LocalUsersViewModel.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import RxRelay
import RxSwift

// MARK: - LocalUsersViewModel

final class LocalUsersViewModel: BaseViewModel {
	// MARK: - Inputs

	let refresh = PublishRelay<Void>()
	let search = BehaviorRelay(value: "")
	let openUserDetails = PublishRelay<UserDetailsViewModel.Context>()

	// MARK: - Outputs

	let users = PublishRelay<[UserTableViewCell.Model]>()

	// MARK: - Internals

	private let allUsers = BehaviorRelay(value: [User]())
	private let filteredUsers = PublishRelay<[User]>()
	private let delete = PublishRelay<User>()

	// MARK: - Services

	private let realmService: RealmServiceProtocol

	// MARK: - Init

	init(realmService: RealmServiceProtocol) {
		self.realmService = realmService