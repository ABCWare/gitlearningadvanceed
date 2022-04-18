//
//  LocalUser.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 12.05.21.
//

import Foundation
import RealmSwift

// MARK: - LocalUser

final class LocalUser: Object {
	@objc dynamic var _id: String!
	@objc dynamic var _a