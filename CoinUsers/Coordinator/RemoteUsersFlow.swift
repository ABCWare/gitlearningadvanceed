//
//  RemoteUsersFlow.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import RxFlow
import Swinject
import UIKit

final class RemoteUsersFlow: NavigationFlow {
	override var assemblies: [Assembly] { [UsersAssembly()] }
	override func navigate(to step: Step) -> FlowContribut