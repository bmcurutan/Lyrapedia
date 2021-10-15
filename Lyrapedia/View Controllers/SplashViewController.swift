//
//  SplashViewController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 10/7/21.
//

import UIKit

class SplashViewController: UIViewController {
    private var imageView: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var enterButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("ENTER", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundColor(.primaryButtonColor, for: .normal)
        button.setBackgroundColor(.accentColor, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "DISCLAIMER"
        label.textColor = .secondaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "All information is intended solely for general supplementary knowledge and may not be used as a substitute for professional training. User acknowledges that the information contained in Lyrapedia is to be used at your own risk."
        label.textColor = .secondaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 300)
        view.backgroundColor = .backgroundColor

        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 350).isActive = true

        view.addSubview(enterButton)
        enterButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
        enterButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        view.rightAnchor.constraint(equalTo: enterButton.rightAnchor, constant: 16).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)

        view.addSubview(textLabel)
        textLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 8).isActive = true
        view.rightAnchor.constraint(equalTo: textLabel.rightAnchor, constant: 16).isActive = true

        view.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        view.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 16).isActive = true
    }

    @objc private func enterButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") 
        UIApplication.shared.windows.first?.rootViewController = rootViewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
