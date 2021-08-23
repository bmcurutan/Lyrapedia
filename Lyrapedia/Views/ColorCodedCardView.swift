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
            if let newCard = card {
                titleLabel.text = newCard.title
                if let imageName = newCard.imageName {
                    imageView.image = UIImage(named: imageName)
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
        label.backgroundColor = .yellow
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var imageView: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var previousButton: UIButton = {
        let button = UIButton()
        button.setTitle("< Previous", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next >", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

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

        addSubview(previousButton)
        previousButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
        previousButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        previousButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)

        addSubview(nextButton)
        nextButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: nextButton.rightAnchor, constant: 16).isActive = true
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
