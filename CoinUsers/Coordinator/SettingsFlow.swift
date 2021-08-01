//
//  SettingsFlow.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import RxFlow
import Swinject
import UIKit

final class SettingsFlow: NavigationFlow {
	override var assemblies: [Assembly] { [SettingsAssembly()] }
	override func navigate