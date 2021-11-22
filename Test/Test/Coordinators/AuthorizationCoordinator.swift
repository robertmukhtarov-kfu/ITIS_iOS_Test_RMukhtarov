//
//  AuthorizationCoordinator.swift
//  Test
//
//  Created by Robert Mukhtarov on 22.11.2021.
//

import UIKit

final class AuthorizationCoordinator: Coordinator {
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    private var childCoordinators: [Coordinator] = []
    private let userService: UserService

    init(navigationController: UINavigationController, userService: UserService) {
        self.navigationController = navigationController
        self.userService = userService
    }

    func start() {
        let vc = AuthorizationViewController()
        vc.completionHandler = { [weak self] user in
            self?.userService.signIn(user: user)
            self?.flowCompletionHandler?()
        }

        navigationController.pushViewController(vc, animated: true)
    }
}
