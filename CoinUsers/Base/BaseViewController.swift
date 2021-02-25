//
//  BaseViewController.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import Reusable
import UIKit

import RxFlow
import RxRelay
import RxSwift

class BaseViewController: UIViewController, StoryboardBased {
	let disposeBag = DisposeBag