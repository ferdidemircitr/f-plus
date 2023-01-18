//
//  HeroHeaderUIView.swift
//  F Plus
//
//  Created by Ferdi DEMİRCİ on 19.11.2022.
//

import UIKit

class HeroHeaderUIView: UIView {
    private let infoButton: UIButton = {
        var button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseForegroundColor = .black
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.image = UIImage(systemName: "info", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        button.configuration?.buttonSize = UIButton.Configuration.Size.mini
        button.configuration?.cornerStyle = .capsule
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let downloadButton: UIButton = {
        var button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseForegroundColor = .black
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.image = UIImage(systemName: "arrow.down.to.line", withConfiguration: UIImage.SymbolConfiguration(pointSize: 12))
        button.configuration?.buttonSize = UIButton.Configuration.Size.mini
        button.configuration?.cornerStyle = .capsule
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = "Play"
        button.configuration?.imagePadding = 10
        button.configuration?.image = UIImage(systemName: "play.fill")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
//        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        addSubview(infoButton)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let horizontalCenter: CGFloat = UIScreen.main.bounds.size.width / 2.0
        
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalCenter - 50),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 100),
            playButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalCenter - 70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 40),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        let infoButtonConstraints = [
            infoButton.leftAnchor.constraint(equalTo: leftAnchor, constant: horizontalCenter + 70),
            infoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            infoButton.widthAnchor.constraint(equalToConstant: 40),
            infoButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
        NSLayoutConstraint.activate(infoButtonConstraints)
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else { return }
        
        heroImageView.sd_setImage(with: url, completed: nil)
    }

    override func layoutSubviews() {
        heroImageView.frame = bounds
    }
    required init(coder: NSCoder) {
        fatalError()
    }
}
