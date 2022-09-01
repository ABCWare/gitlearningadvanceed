//
//  RealmService.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 12.05.21.
//

import RealmSwift

import RxSwift

// MARK: - RealmServiceProtocol

protocol RealmServiceProtocol {
	func read() -> Single<[User]>
	func save(user: User) -> Single<Void>
	func