//
//  BackCardView.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//

import UIKit

class BackCardView: UIView {
    private var frontCardView: UIView?

    private var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("←", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var handleBar: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 2
        view.layer.masksToBounds = true
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var difficultyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var tipsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Tips"
        label.textColor = .primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var tipsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var progressionsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Progressions"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var progressionsImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var progressionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var regressionsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Regressions"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var regressionsImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var regressionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    convenience init(card: Card, frontCardView: UIView) {
        self.init()
        self.frontCardView = frontCardView

        titleLabel.text = "\(card.title)"

        let mutableString = NSMutableAttributedString(string: "Difficulty  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        var shapes = "▱▱▱"
        if let difficulty = card.difficulty {
            switch difficulty {
            case 1:
                shapes = "▰▱▱"
            case 2:
                shapes = "▰▰▱"
            case 3:
                shapes = "▰▰▰"
            default:
                break
            }
            mutableString.append(NSMutableAttributedString(string: shapes, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22)]))
            mutableString.setColor(for: shapes, with: .accentColor)
            difficultyLabel.attributedText = mutableString
        }

        if let tips = card.tips {
            var text = ""
            for (i, line) in tips.enumerated() {
                text += line
                if i < tips.count - 1 {
                    text += "\n"
                }
            }
            tipsLabel.text = text
        }

        if let progressionsImageName = card.progressionsImageName {
            progressionsImageView.image = UIImage(named: progressionsImageName)
        } else {
            progressionsImageView.image = #imageLiteral(resourceName: "placeholder")
        }

        if let progressions = card.progressions {
            var text = ""
            for (i, line) in progressions.enumerated() {
                text += line
                if i < progressions.count - 1 {
                    text += "\n"
                }
            }
            progressionsLabel.text = text
        }

        if let regressionsImageName = card.regressionsImageName {
            regressionsImageView.image = UIImage(named: regressionsImageName)
        } else {
            regressionsImageView.image = #imageLiteral(resourceName: "placeholder")
        }

        if let regressions = card.regressions {
            var text = ""
            for (i, line) in regressions.enumerated() {
                text += line
                if i < regressions.count - 1 {
                    text += "\n"
                }
            }
            regressionsLabel.text = text
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundColor

        addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped)))

        addSubview(handleBar)
        handleBar.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        handleBar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        handleBar.widthAnchor.constraint(equalToConstant: 48).isActive = true
        handleBar.heightAnchor.constraint(equalToConstant: 4).isActive = true

        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true

        addSubview(difficultyLabel)
        difficultyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        difficultyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true

        addSubview(tipsTitleLabel)
        tipsTitleLabel.topAnchor.constraint(equalTo: difficultyLabel.bottomAnchor, constant: 16).isActive = true
        tipsTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: tipsTitleLabel.rightAnchor, constant: 16).isActive = true

        addSubview(tipsLabel)
        tipsLabel.topAnchor.constraint(equalTo: tipsTitleLabel.bottomAnchor, constant: 8).isActive = true
        tipsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: tipsLabel.rightAnchor, constant: 16).isActive = true

//        addSubview(regressionsTitleLabel)
//        regressionsTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24).isActive = true
//        regressionsTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
//        rightAnchor.constraint(equalTo: regressionsTitleLabel.rightAnchor, constant: 16).isActive = true
//
//        addSubview(regressionsImageView)
//        regressionsImageView.topAnchor.constraint(equalTo: regressionsTitleLabel.bottomAnchor, constant: 8).isActive = true
//        regressionsImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
//        regressionsImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        regressionsImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//
//        addSubview(regressionsLabel)
//        regressionsLabel.topAnchor.constraint(equalTo: regressionsTitleLabel.bottomAnchor, constant: 8).isActive = true
//        regressionsLabel.leftAnchor.constraint(equalTo: regressionsImageView.rightAnchor, constant: 8).isActive = true
//        rightAnchor.constraint(equalTo: regressionsLabel.rightAnchor, constant: 16).isActive = true
//
//        addSubview(progressionsTitleLabel)
//        progressionsTitleLabel.topAnchor.constraint(equalTo: regressionsImageView.bottomAnchor, constant: 24).isActive = true
//        progressionsTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
//        rightAnchor.constraint(equalTo: progressionsTitleLabel.rightAnchor, constant: 16).isActive = true
//
//        addSubview(progressionsImageView)
//        progressionsImageView.topAnchor.constraint(equalTo: progressionsTitleLabel.bottomAnchor, constant: 8).isActive = true
//        progressionsImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
//        bottomAnchor.constraint(equalTo: progressionsImageView.bottomAnchor, constant: 16).isActive = true
//        progressionsImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        progressionsImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//
//        addSubview(progressionsLabel)
//        progressionsLabel.topAnchor.constraint(equalTo: progressionsTitleLabel.bottomAnchor, constant: 8).isActive = true
//        progressionsLabel.leftAnchor.constraint(equalTo: progressionsImageView.rightAnchor, constant: 8).isActive = true
//        rightAnchor.constraint(equalTo: progressionsLabel.rightAnchor, constant: 16).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    private func closeButtonTapped() {
        let toView = frontCardView ?? self
        UIView.transition(from: self,
                          to: toView,
                          duration: 0.6,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews]) { [weak self] _ in
                            self?.removeFromSuperview() 
                          }
    }
}
