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
	var message