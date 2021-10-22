//
//  CardCollectionViewCell.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 9/14/21.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    private var imageView: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var labelBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .right
        label.textColor = .primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true

        imageView.addSubview(labelBackground)
        imageView.addSubview(titleLabel)
        labelBackground.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: labelBackground.bottomAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: labelBackground.rightAnchor).isActive = true
        labelBackground.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, constant: 8).isActive = true

        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        contentView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        contentView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 8).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
