//
//  NavigationFlow.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import Foundation
import RxFlow
import Swinject
import SwinjectAutoregistration
import UIKit

class NavigationFlow: Flow {
	var root: Presentable { self.rootViewController }
	private let rootViewController: UINavigationController
	private(