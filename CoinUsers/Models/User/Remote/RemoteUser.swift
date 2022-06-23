
//
//  RemoteUser.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 11.05.21.
//

import Foundation

// MARK: - RemoteUser

struct RemoteUser: Decodable {
	// MARK: - Nested

	struct Login: Decodable, Hashable {
		let uuid: String
	}

	struct Name: Decodable, Hashable {