//
//  CardsViewController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//

import UIKit

class CardsViewController: UIViewController {
    internal var viewModel = CardsViewModel()
    internal var cards: [Card] = []

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .darkAccentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = viewModel.title

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCollectionViewCell")

        titleLabel.text = viewModel.title
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true

        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: collectionView.rightAnchor, constant: 16).isActive = true
    }
}

extension CardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        let card = cards[indexPath.row]
        if let imageName = card.imageName {
            cell.imageView.image = UIImage(named: imageName)
        } else {
            cell.imageView.image = #imageLiteral(resourceName: "placeholder")
            cell.imageView.alpha = 0.25
        }
        cell.titleLabel.text = card.title
        return cell
    }
}

extension CardsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimen = UIScreen.main.bounds.width / 3 - 32
        return CGSize(width: dimen, height: dimen)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let cardViewController = CardViewController(cards: cards, index: indexPath.row)
        present(cardViewController, animated: true, completion: nil)
    }
}

private class CardCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 11)
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

//        imageView.addSubview(titleLabel)
//        titleLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 4).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
//        contentView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 4).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
