//
//  LoginScreenViewController.swift
//  F Plus
//
//  Created by Ferdi DEMİRCİ on 24.12.2022.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "poster")
        return imageView 
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height / 2)
        posterImageView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "fplus_transparent")
        return imageView
        
    }()
    
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "The world's best stories. All in one place."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17.0, weight: UIFont.Weight.medium)
        return label
    }()
    
    private let signinButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "sign in"
        button.setTitle("SIGN IN", for: UIControl.State.normal)
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: UIFont.Weight.medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTopSigninButton), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    private let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .red
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .lightGray
        return line
    }()
    
    private let signupLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up for $5,99/month or save 15% for an annual subscription fee of just $49,99/year."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15.00, weight: UIFont.Weight.regular)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("SIGN UP NOW", for: UIControl.State.normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: UIFont.Weight.medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTopSignupButton), for: UIControl.Event.touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(posterImageView)
        addGradient()
        view.addSubview(logoImageView)
        view.addSubview(logoLabel)
        view.addSubview(signinButton)
        view.addSubview(lineView)
        view.addSubview(signupLabel)
        view.addSubview(signupButton)
        configureConstraints()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        posterImageView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height / 2)
        logoImageView.frame = CGRect(x: (screenSize.width / 2) - 40,
                                     y: (screenSize.height / 2) - 100,
                                     width: 80,
                                     height: 80)
        logoLabel.frame = CGRect(x: 20,
                                 y: (screenSize.height / 2),
                                 width: screenSize.width - 40,
                                 height: 50)
    }
    func configureConstraints() {
        let signinButtonConstraints = [
            signinButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signinButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signinButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            signinButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let lineViewConstraints = [
            lineView.bottomAnchor.constraint(equalTo: signinButton.topAnchor, constant: 0),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            lineView.heightAnchor.constraint(equalToConstant: 0.5)
        ]
        let signupLabelConstraints = [
            signupLabel.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -20),
            signupLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signupLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        let signupButtonConstraints = [
            signupButton.bottomAnchor.constraint(equalTo: signupLabel.topAnchor, constant: -10),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signupButton.heightAnchor.constraint(equalToConstant: 46)
        ]
        NSLayoutConstraint.activate(signinButtonConstraints)
        NSLayoutConstraint.activate(lineViewConstraints)
        NSLayoutConstraint.activate(signupLabelConstraints)
        NSLayoutConstraint.activate(signupButtonConstraints)
    }
    
    @objc func didTopSigninButton() {
        print("Signİn Tıklandı")
        let signinVC = SigninViewController()
        self.navigationController?.pushViewController(signinVC, animated: true)
    }
    
    @objc func didTopSignupButton() {
        print("SignUp Tıklandı")
        let signupVC = SignupViewController()
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    
}
