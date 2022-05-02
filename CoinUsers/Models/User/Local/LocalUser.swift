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
	@objc dynamic var _avatarURL: String!
	@objc dynamic var _title: String!
	@objc dynamic var _firstName: String!
	@objc dynamic var _lastName: String!
	@objc dynamic var _gender: String!
	@objc dynamic var _age = -1
	@objc dynamic var _email: String!
	@objc dynamic var _phone: String!
	@objc dynamic var _address: LocalAddress!

	convenience init(user: User