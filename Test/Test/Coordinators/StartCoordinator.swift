//
//  StartCoordinator.swift
//  Test
//
//  Created by Robert Mukhtarov on 22.11.2021.
//

import UIKit

enum SelectedStartFlow {
    case signIn
    case signUp
}

final class StartCoordinator: Coordinator {
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    private var childCoordinators: [Coordinator] = []
    private let userService: UserService

    init(navigationController: UINavigationController, userService: UserService) {
        self.navigationController = navigationController
        self.userService = userService
    }

    func start() {
        let vc = StartViewController()
        vc.completionHandler = { [weak self] selectedFlow in
            switch selectedFlow {
            case .signIn:
                self?.showAuthorizationFlow()
            case .signUp:
                self?.showRegistrationFlow()
            }
        }
        
        navigationController.setViewControllers([vc], animated: true)
    }

    func showAuthorizationFlow() {
        let authorizationCoordinator = AuthorizationCoordinator(
            navigationController: navigationController,
            userService: userService
        )
        childCoordinators.append(authorizationCoordinator)
        authorizationCoordinator.flowCompletionHandler = { [weak self] in
            self?.childCoordinators.removeAll()
            self?.flowCompletionHandler?()
        }
        authorizationCoordinator.start()
    }

    func showRegistrationFlow() {
        let registrationCoordinator = RegistrationCoordinator(
            navigationController: navigationController,
            userService: userService
        )
        childCoordinators.append(registrationCoordinator)
        registrationCoordinator.flowCompletionHandler = { [weak self] in
            self?.childCoordinators.removeAll()
            self?.flowCompletionHandler?()
        }
        registrationCoordinator.start()
    }
}
