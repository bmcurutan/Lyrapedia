//
//  BackCardView.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//


import UIKit

class BackCardView: UIView {
    private var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("x", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Description"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var difficultyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Difficulty ★☆☆☆☆"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "1. Starting from a stag seat" +
            "\n2. Place your grip in an opposing grip on the top of the hoop" +
            "\n3. Transition teh bottom of the hoop so that it is right on the tail bone and the side of the hoop is on one shoulder" +
            "\n4. Move the top leg up onto the opposite side of the hoop" +
            "\n5. Move the second leg on the hoop underneath the first leg while applying pressure through the feet and the shoulder to secure the position"
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
        label.text = "- Pointing your toes" +
            "\n- Hands-free" +
            "\n- Combining the seated legs options"
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
        label.text = "- Keep your hands on the hoop" +
            "\n- Do not point your toes, keep the feet flat on the side of the hoop"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        closeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        closeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped)))

        addSubview(difficultyLabel)
        difficultyLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 16).isActive = true
        difficultyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true

        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: difficultyLabel.bottomAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 16).isActive = true

        addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 16).isActive = true

        addSubview(progressionsTitleLabel)
        progressionsTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24).isActive = true
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

        addSubview(regressionsTitleLabel)
        regressionsTitleLabel.topAnchor.constraint(equalTo: progressionsImage.bottomAnchor, constant: 24).isActive = true
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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    private func closeButtonTapped() {
        removeFromSuperview()
    }
}
