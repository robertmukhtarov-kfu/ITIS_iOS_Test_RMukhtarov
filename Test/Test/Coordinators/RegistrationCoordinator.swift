//
//  AuthorizationCoordinator.swift
//  Test
//
//  Created by Robert Mukhtarov on 22.11.2021.
//

import UIKit

final class RegistrationCoordinator: Coordinator {
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    private var childCoordinators: [Coordinator] = []
    private let userService: UserService

    private var user = User(login: "", password: "")

    init(navigationController: UINavigationController, userService: UserService) {
        self.navigationController = navigationController
        self.userService = userService
    }

    func start() {
        showEnterLoginFlow()
    }

    func showEnterLoginFlow() {
        let vc = LoginViewController()
        vc.completionHandler = { [weak self] login in
            self?.user.login = login
            self?.showEnterPasswordFlow()
        }

        navigationController.pushViewController(vc, animated: true)
    }

    func showEnterPasswordFlow() {
        let vc = PasswordViewController()
        vc.completionHandler = { [weak self] password in
            guard let self = self else { return }
            self.user.password = password
            self.userService.signUp(user: self.user)

            self.flowCompletionHandler?()
        }

        navigationController.pushViewController(vc, animated: true)
    }
}
