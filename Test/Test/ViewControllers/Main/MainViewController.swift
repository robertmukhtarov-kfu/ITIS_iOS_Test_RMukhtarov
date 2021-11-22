//
//  MainViewController.swift
//  Test
//
//  Created by Robert Mukhtarov on 22.11.2021.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    var completionHandler: (() -> ())?

    private let activityService = ActivityService()

    private lazy var resetBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetBarButtonPressed))
        return barButtonItem
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var signOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Out", for: .normal)
        button.addTarget(self, action: #selector(signOutButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = resetBarButtonItem
        view.backgroundColor = .systemBackground
        title = "Activities"
        addSubviews()
        makeConstraints()
        loadActivity()
    }

    private func addSubviews() {
        view.addSubview(label)
        view.addSubview(signOutButton)
    }

    private func makeConstraints() {
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        signOutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(16)
        }
    }

    @objc
    private func resetBarButtonPressed() {
        loadActivity()
    }

    @objc
    private func signOutButtonPressed() {
        completionHandler?()
    }

    private func loadActivity() {
        activityService.loadActivity { [weak label] activity in
            label?.text = activity
        }
    }
}
