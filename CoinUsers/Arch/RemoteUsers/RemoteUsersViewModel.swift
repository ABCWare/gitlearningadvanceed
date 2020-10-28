//
//  RemoteUsersViewModel.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import RxRelay
import RxSwift

// MARK: - RemoteUsersViewModel

final class RemoteUsersViewModel: BaseViewModel {
	// MARK: - Inputs

	let refresh = PublishRelay<Void>()
	let loadMore = PublishRelay<Void>()
	let search = BehaviorRelay(value: "")
	let openUserDetails = PublishRelay<UserDetailsViewModel.Context>()

	// MARK: - Outputs

	let users = PublishRelay<[UserTableViewCell.Model]>()

	// MARK: - Services

	private let usersService: RemoteUsersServiceProtocol
	private let realmService: RealmServiceProtocol

	// MARK: - Internals

	private let isLoading = BehaviorRelay(value: false)
	private let allUsers = BehaviorRelay(value: [User]())
	private let filteredUsers = PublishRelay<[User]>()
	private let localUsers = PublishRelay<[User]>()
	private let save = PublishRelay<User>()
	private let delete = PublishRelay<User>()

	// MARK: - Init

	init(usersService: RemoteUsersServiceProtocol, realmService: RealmServiceProtocol) {
		self.usersService = usersService
		self.realmService = realmService
		super.init()

		doBindings()
	}

	// MARK: - Reactive

	private func doBindings() {
		bindAPI()
		bindRealm()
		bindUsers()
		bindStepper()
	}

	// MARK: API

	privat