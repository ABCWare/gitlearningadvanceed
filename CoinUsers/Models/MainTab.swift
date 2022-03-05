//
//  MainTab.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 11.05.21.
//

import UIKit

enum MainTab: String, CaseIterable {
	case remoteUsers
	case localUsers
	case settings

	private var symbolName: String {
		switch self {
		case .remoteUsers: return "person.2"
		case