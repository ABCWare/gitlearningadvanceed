//
//  UsersService.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 11.05.21.
//

import Foundation

import Alamofire

import RxSwift

// MARK: - AlertableError

protocol AlertableError: Error {
	var title: String? { get }
	var message: String? { get }
}

// MARK: - ServiceError

enum RemoteServiceError: AlertableError {
	case networkError(title: String? = "Network Error", message: String? = nil)

	var title: String? {
		switch self {
		case .networkError(let title, _): return title
		}
	}

	var message: String? {
		switch self {
		case .networkError(_, let message): return message
		}
	}
}

// MARK: - UsersServiceProtocol

protocol RemoteUsersServiceProtocol {
	func rea