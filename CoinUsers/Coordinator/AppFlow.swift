//
//  AppFlow.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import Swinject
import SwinjectAutoregistration

import RxFlow
import RxRelay

import UIKit

// MARK: - AppFlow

final class AppFlow: Flow {
	var root: Presentable { rootViewController }

	private let rootViewController: UITabBarController = {
		let tabBarController = UITabBarController()
		tabBarController.tabBar.tintColor = .main1
		return tabBarController
	}()

	private var parentAssembler: Assembler

	init(parentAssembler: Assembler) {
		self.parentAssembler = parentAssembler
	}

	func navigate(to step: Step) -> FlowContributors {
		guard (step as? AppStep) == .main else { return .none }
		return initFlows(for: MainTab.allCases)
	}

	private func initFlows(for tabs: [MainTab]) -> FlowContributors {
		let flowConfigs = tabs.map { [weak self] in self?.config(for: $0) }
		let flows = flowConfigs.compactMap { $0?.0 }
		let flowContributors = flowConfigs.compactMap { $0?.1 }

		Flows.use(flows, when: .created) { vcs in
			tabs.enumerated().forEach { index, tab in
				let item = UITabBarItem(title: tab.title, i