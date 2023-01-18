//
//  SigninViewController.swift
//  F Plus
//
//  Created by Ferdi DEMİRCİ on 25.12.2022.
//

import UIKit
import Firebase

class SigninViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in with your email"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "You will use this email and password to log in to your F+ account and watch your favorite shows and movies."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        return label
    }()
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email address"
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .placeholderText
        textField.layer.masksToBounds = true
        textField.tintColor = .red
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .placeholderText
        textField.layer.masksToBounds = true
        textField.tintColor = .red
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        
        return textField
    }()
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("I forgot my password?", for: UIControl.State.normal)
        button.setTitleColor(.red, for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTopSigninButton), for: UIControl.Event.touchUpInside)
        return button
    }()
    private let signinButton: UIButton = {
        let button = UIButton()
        button.setTitle("SIGN IN", for: UIControl.State.normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTopSigninButton), for: UIControl.Event
            .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navBarConfiguration()
        
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(signinButton)
        
        configureConstraints()
    }
    func navBarConfiguration() {
        
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "fplus_transparent")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        
        navigationController?.navigationBar.tintColor = .white
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    func configureConstraints() {
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ]
        let descriptonLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ]
        let emailTextFieldConstraints = [
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 46)
        ]
        let passwordTextFieldConstraints = [
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 46)
        ]
        let forgotPasswordButtonConstraints = [
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
//            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 46)
        ]
        
        let signinButtonConstraints = [
            signinButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 10),
            signinButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signinButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signinButton.heightAnchor.constraint(equalToConstant: 46)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(descriptonLabelConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(forgotPasswordButtonConstraints)
        NSLayoutConstraint.activate(signinButtonConstraints)
    }
    
    @objc func didTopSigninButton() {
        
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { data, error in
                if error != nil {
                    print("Giriş başarısız!")
                    self.alert(title: "Username or password error!", message: "Please check your username or password!")
                } else {
                    print("Giriş başarılı.")
                    let mainTabBarVC = MainTabBarViewController()
                    mainTabBarVC.modalPresentationStyle = .currentContext
                    self.view.window?.rootViewController = mainTabBarVC
                }
                
            }
        }else {
            alert(title: "Empty space error!", message: "Please fill out all the free spaces!")
        }
        
        
        
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
        
    }
}
