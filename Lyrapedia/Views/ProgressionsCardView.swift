//
//  ProgressionsCardView.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//

import UIKit

class ProgressionsCardView: UIView {
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Basic Sit"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var image1: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var image2: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var image3: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var image4: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var label1: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var label2: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var label3: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var label4: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundColor

        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true

        addSubview(image1)
        image1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        image1.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        image1.widthAnchor.constraint(equalToConstant: 175).isActive = true
        image1.heightAnchor.constraint(equalToConstant: 175).isActive = true

        addSubview(image2)
        image2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: image2.rightAnchor, constant: 16).isActive = true
        image2.widthAnchor.constraint(equalToConstant: 175).isActive = true
        image2.heightAnchor.constraint(equalToConstant: 175).isActive = true

        addSubview(image3)
        image3.topAnchor.constraint(equalTo: image1.bottomAnchor, constant: 8).isActive = true
        image3.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        image3.widthAnchor.constraint(equalToConstant: 175).isActive = true
        image3.heightAnchor.constraint(equalToConstant: 175).isActive = true

        addSubview(image4)
        image4.topAnchor.constraint(equalTo: image2.bottomAnchor, constant: 8).isActive = true
        rightAnchor.constraint(equalTo: image4.rightAnchor, constant: 16).isActive = true
        image4.widthAnchor.constraint(equalToConstant: 175).isActive = true
        image4.heightAnchor.constraint(equalToConstant: 175).isActive = true

        image1.addSubview(label1)
        label1.topAnchor.constraint(equalTo: image1.topAnchor, constant: 4).isActive = true
        label1.leftAnchor.constraint(equalTo: image1.leftAnchor, constant: 8).isActive = true

        image2.addSubview(label2)
        label2.topAnchor.constraint(equalTo: image2.topAnchor, constant: 4).isActive = true
        label2.leftAnchor.constraint(equalTo: image2.leftAnchor, constant: 8).isActive = true

        image3.addSubview(label3)
        label3.topAnchor.constraint(equalTo: image3.topAnchor, constant: 4).isActive = true
        label3.leftAnchor.constraint(equalTo: image3.leftAnchor, constant: 8).isActive = true

        image4.addSubview(label4)
        label4.topAnchor.constraint(equalTo: image4.topAnchor, constant: 4).isActive = true
        label4.leftAnchor.constraint(equalTo: image4.leftAnchor, constant: 8).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
