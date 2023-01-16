
//
//  UserTableViewCell.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 12.05.21.
//

import Kingfisher
import Reusable
import UIKit

import RxGesture
import RxSwift

// MARK: - UserCellDelegate

protocol UserCellDelegate: AnyObject {
	func didTapActionButton(for model: UserTableViewCell.Model)
}

// MARK: - UserTableViewCell

final class UserTableViewCell: UITableViewCell, NibReusable {
	// MARK: - UserCellModel

	struct Model {
		let user: User
		let isSaved: Bool
		let search: String
	}

	// MARK: - Delegate

	weak var delegate: UserCellDelegate?

	// MARK: - Outlets

	@IBOutlet private var avatarImageView: UIImageView! {