
//
//  ServiceAssembly.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import Swinject
import SwinjectAutoregistration

import Alamofire
import RealmSwift

final class ServiceAssembly: Assembly {
	func assemble(container: Container) {
		// MARK: - Session