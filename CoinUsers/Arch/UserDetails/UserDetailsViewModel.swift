//
//  UserDetailsViewModel.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 12.05.21.
//

import RxRelay
import RxSwift

// MARK: - UserDetailsViewModel

final class UserDetailsViewModel: BaseViewModel {
	// MARK: - Context

	struct Context {
		let user: User
		let isSaved: Bool
	}

	// MARK: - Inputs

	let actionTapped = PublishRelay<Void>()
	let delete = PublishRelay<User>()

	// MARK: - Outputs

	let user: BehaviorRelay<User>
	let action = PublishRelay<UserDetailRowView.Action>()
	let isSaved: BehaviorRelay<Bool>

	// MARK: - Services

	private let realmService: