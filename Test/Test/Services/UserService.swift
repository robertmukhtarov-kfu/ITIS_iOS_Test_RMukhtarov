//
//  UserService.swift
//  Test
//
//  Created by Robert Mukhtarov on 22.11.2021.
//

import Foundation

final class UserService {
    func isAuthorized() -> Bool {
        return false
    }

    func signIn(user: User) {
        print("Signed In")
    }

    func signUp(user: User) {
        print("Signed Up")
    }
}
