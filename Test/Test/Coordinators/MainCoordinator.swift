//
//  StartCoordinator.swift
//  Test
//
//  Created by Robert Mukhtarov on 22.11.2021.
//

import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    private var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MainViewController()
        vc.completionHandler = { [weak self] in
            self?.flowCompletionHandler?()
        }
        
        navigationController.setViewControllers([vc], animated: true)
    }
}
