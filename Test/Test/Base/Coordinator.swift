//
//  Coordinator.swift
//  Test
//
//  Created by Robert Mukhtarov on 22.11.2021.
//

import UIKit

typealias CoordinatorHandler = () -> Void

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var flowCompletionHandler: CoordinatorHandler? { get set }

    func start()
}
