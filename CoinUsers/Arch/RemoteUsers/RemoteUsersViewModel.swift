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
	let openUserDetails = PublishRelay<U