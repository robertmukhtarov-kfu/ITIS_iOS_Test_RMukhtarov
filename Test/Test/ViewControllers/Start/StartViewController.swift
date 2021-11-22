//
//  StartViewController.swift
//  Test
//
//  Created by Robert Mukhtarov on 22.11.2021.
//

import UIKit
import SnapKit

final class StartViewController: UIViewController, FlowController {
    var completionHandler: ((SelectedStartFlow) -> ())?

    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signInButton, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    @objc
    private func signInButtonPressed() {
        completionHandler?(.signIn)
    }

    @objc
    private func signUpButtonPressed() {
        completionHandler?(.signUp)
    }
}
