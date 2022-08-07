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

	func scene(_ scene: UIScen