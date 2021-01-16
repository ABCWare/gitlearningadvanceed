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

	let actionTapped