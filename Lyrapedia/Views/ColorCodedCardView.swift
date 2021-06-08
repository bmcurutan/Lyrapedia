//
//  ColorCodedCardView.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//

import UIKit

class ColorCodedCardView: UIView {
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

    private var footerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Difficulty ★★★★☆"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

        addSubview(image)
        image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        image.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: 350).isActive = true
        image.heightAnchor.constraint(equalToConstant: 350).isActive = true

        addSubview(footerLabel)
        footerLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8).isActive = true
        footerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
