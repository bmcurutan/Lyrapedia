//
//  ColorCodedCardView.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//

import UIKit

class ColorCodedCardView: UIView {
    private var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("x", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Basic Sit"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var image: UIImageView = {
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

        addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        closeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        closeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped)))

        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 8).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

        addSubview(image)
        image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        image.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: 350).isActive = true
        image.heightAnchor.constraint(equalToConstant: 350).isActive = true

        addSubview(previousButton)
        previousButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16).isActive = true
        previousButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true

        addSubview(nextButton)
        nextButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: nextButton.rightAnchor, constant: 16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    private func closeButtonTapped() {
        removeFromSuperview()
    }
}
