//
//  SceneDelegate.swift
//  CoinUsers
//
//  Created by Hovak Davtyan on 10.05.21.
//

import UIKit

import RxFlow
import RxSwift

import Swinject
import SwinjectAutoregistration

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	let disposeBag = DisposeBag()
	let coordinator = FlowCoordinator()
	private var parentAssembler = Assembler([FlowAssembly(), ServiceAssembly()])
	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: windowScene)
		guard let window = window else { return }

		let appFlow = parentAssemble