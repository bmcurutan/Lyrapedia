//
//  ColorCodedCardView.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//

import UIKit

protocol ColorCodedCardViewDelegate {
    func previousButtonTapped()
    func nextButtonTapped()
}

class ColorCodedCardView: UIView {
    var delegate: ColorCodedCardViewDelegate?

    var card: Card? {
        didSet {
            if let card = card {
                titleLabel.text = card.title
                if let imageName = card.imageName {
                    imageView.image = UIImage(named: imageName)
                } else {
                    imageView.image = UIImage(named: "placeholder")
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
        label.backgroundColor = .darkAccentColor
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

    private var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Tap on image to flip card over →"
        label.textAlignment = .center
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var previousButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("← Previous", for: .normal)
        button.setTitleColor(.primaryButtonColor, for: .normal)
        button.setTitleColor(.accentColor, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var nextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("Next →", for: .normal)
        button.setTitleColor(.primaryButtonColor, for: .normal)
        button.setTitleColor(.accentColor, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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

        addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: textLabel.rightAnchor, constant: 16).isActive = true

        addSubview(previousButton)
        previousButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16).isActive = true
        previousButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        previousButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)

        addSubview(nextButton)
        nextButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: nextButton.rightAnchor, constant: 16).isActive = true
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func showPreviousButton(_ show: Bool = true) {
        previousButton.isHidden = !show
    }

    func showNextButton(_ show: Bool = true) {
        nextButton.isHidden = !show
    }

    @objc
    private func closeButtonTapped() {
        removeFromSuperview()
    }

    @objc
    private func previousButtonTapped() {
        delegate?.previousButtonTapped()
    }

    @objc
    private func nextButtonTapped() {
        delegate?.nextButtonTapped()
    }
}
