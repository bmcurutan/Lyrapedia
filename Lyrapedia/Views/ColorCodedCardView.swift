//
//  ColorCodedCardView.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//

import UIKit

// TODO detect app screenshot and provide feedback form
class ColorCodedCardView: UIView {
    // TODO put this in an init function
    var card: Card? {
        didSet {
            if let card = card {
                titleLabel.text = card.title
                if let imageName = card.imageName {
                    imageView.image = UIImage(named: imageName)
                } else {
                    imageView.image = UIImage(named: "placeholder")
                }
                let mutableString = NSMutableAttributedString(string: "Difficulty  ")
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

                if let description = card.description {
                    var text = ""
                    for (i, line) in description.enumerated() {
                        text += line
                        if i < description.count - 1 {
                            text += "\n"
                        }
                    }
                    descriptionTextView.text = text
                }
            }
        }
    }

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
        label.backgroundColor = .accentColor
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var imageView: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var difficultyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Description"
        label.textColor = .primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = .primaryTextColor
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundColor

        addSubview(handleBar)
        handleBar.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        handleBar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        handleBar.widthAnchor.constraint(equalToConstant: 48).isActive = true
        handleBar.heightAnchor.constraint(equalToConstant: 4).isActive = true

        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: handleBar.bottomAnchor, constant: 8).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 350).isActive = true

        addSubview(difficultyLabel)
        difficultyLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
        difficultyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: difficultyLabel.rightAnchor, constant: 16).isActive = true

        addSubview(descriptionTitleLabel)
        descriptionTitleLabel.topAnchor.constraint(equalTo: difficultyLabel.bottomAnchor, constant: 16).isActive = true
        descriptionTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: descriptionTitleLabel.rightAnchor, constant: 16).isActive = true

        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        bottomAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: descriptionTextView.rightAnchor, constant: 16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    private func closeButtonTapped() {
        removeFromSuperview()
    }
}
