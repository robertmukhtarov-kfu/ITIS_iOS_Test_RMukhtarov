//
//  LoginViewController.swift
//  Test
//
//  Created by Robert Mukhtarov on 22.11.2021.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController, FlowController {
    var completionHandler: ((String) -> ())?

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter login"
        return textField
    }()

    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginTextField, nextButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }

    @objc
    private func nextButtonPressed() {
        guard let login = loginTextField.text,
              !login.isEmpty
        else {
            showAlert(title: "Invalid login", message: "Login must not be empty")
            return
        }

        completionHandler?(login)
    }
}
