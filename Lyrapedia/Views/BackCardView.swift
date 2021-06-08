//
//  BackCardView.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//


import UIKit

class BackCardView: UIView {
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Description"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var regressionsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Regressions"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var regressionsImage: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var regressionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var progressionsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Progressions"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var progressionsImage: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var progressionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 16).isActive = true

        addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 16).isActive = true

        addSubview(regressionsTitleLabel)
        regressionsTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24).isActive = true
        regressionsTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: regressionsTitleLabel.rightAnchor, constant: 16).isActive = true

        addSubview(regressionsImage)
        regressionsImage.topAnchor.constraint(equalTo: regressionsTitleLabel.bottomAnchor, constant: 8).isActive = true
        regressionsImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        regressionsImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        regressionsImage.heightAnchor.constraint(equalToConstant: 100).isActive = true

        addSubview(regressionsLabel)
        regressionsLabel.topAnchor.constraint(equalTo: regressionsTitleLabel.bottomAnchor, constant: 8).isActive = true
        regressionsLabel.leftAnchor.constraint(equalTo: regressionsImage.rightAnchor, constant: 8).isActive = true
        rightAnchor.constraint(equalTo: (regressionsLabel).rightAnchor, constant: 16).isActive = true

        addSubview(progressionsTitleLabel)
        progressionsTitleLabel.topAnchor.constraint(equalTo: regressionsLabel.bottomAnchor, constant: 24).isActive = true
        progressionsTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: progressionsTitleLabel.rightAnchor, constant: 16).isActive = true

        addSubview(progressionsImage)
        progressionsImage.topAnchor.constraint(equalTo: progressionsTitleLabel.bottomAnchor, constant: 8).isActive = true
        progressionsImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        progressionsImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        progressionsImage.heightAnchor.constraint(equalToConstant: 100).isActive = true

        addSubview(progressionsLabel)
        progressionsLabel.topAnchor.constraint(equalTo: progressionsTitleLabel.bottomAnchor, constant: 8).isActive = true
        progressionsLabel.leftAnchor.constraint(equalTo: progressionsImage.rightAnchor, constant: 8).isActive = true
        rightAnchor.constraint(equalTo: (progressionsLabel).rightAnchor, constant: 16).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
