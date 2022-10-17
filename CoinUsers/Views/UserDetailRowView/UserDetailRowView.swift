//
//  UserDetailRowView.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 12.05.21.
//

import Reusable
import UIKit

// MARK: - UserDetailRowViewDelegate

protocol UserDetailRowViewDelegate: AnyObject {
	func didSelectAction(_ action: UserDetailRowView.Action)
}

// MARK: - UserDetailRowView

final class UserDetailRowView: UIView, NibOwnerLoadable {
	// MARK: - Action

	enum Action: String {
		case email
		case phone = "phone number"
	}

	private var action: Action? {
		didSet {
			switch action {
			case .email?:
				actionButton.setImage(.arrow, for: .normal)
				actionButton.isHidden = false
			case .phone?:
				actionButton.setImage(.phone, for: .normal)
				actionButton.isHidden = false
			case .none:
				actionButto