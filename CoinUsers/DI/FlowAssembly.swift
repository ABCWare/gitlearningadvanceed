//
//  FlowAssembly.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import Swinject
import SwinjectAutoregistration

final class FlowAssembly: Assembly {
	func assemble(container: Container) {
		// MARK: - App

		container.register(AppFlow.self) { (_, assembler: Assembler) in
			AppFlow(parentAssembler: assembler)
		}

		// MARK: - Remote

		container.autoregister(
			RemoteUsersFlow.self,
			ar