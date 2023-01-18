//
//  UserViewController.swift
//  F Plus
//
//  Created by Ferdi DEMİRCİ on 10.01.2023.
//

import UIKit
import Firebase

class UserViewController: UIViewController {

    private let signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signOut), for: UIControl.Event.touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(signOutButton)
        configureConstraints()
    }
    
    func configureConstraints() {
        let signOutButtonConstraints = [
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(signOutButtonConstraints)
        
    }
    
    @objc func signOut() {
        do {
            try Auth.auth().signOut()
            let loginScreenVC = LoginScreenViewController()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("Sign Out Error!")
        }
        
    }
    
}
