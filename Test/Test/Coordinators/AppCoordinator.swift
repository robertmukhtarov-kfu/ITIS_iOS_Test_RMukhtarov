//
//  AppCoordinator.swift
//  Test
//
//  Created by Robert Mukhtarov on 22.11.2021.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    private var childCoordinators: [Coordinator] = []
    private let userService = UserService()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let isAuthorized = userService.isAuthorized()
        isAuthorized ? showMainFlow() : showStartFlow()
    }

    private func showStartFlow() {
        let startCoordinator = StartCoordinator(navigationController: navigationController, userService: userService)
        childCoordinators.append(startCoordinator)
        startCoordinator.flowCompletionHandler = { [weak self] in
            guard let self = self else { return }
            self.childCoordinators.removeAll { $0 === startCoordinator }
            self.showMainFlow()
        }
        startCoordinator.start()
    }

    private func showMainFlow() {
        // TODO: main flow
        navigationController.setViewControllers([MainViewController()], animated: true)
    }
}
