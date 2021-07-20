//
//  CardViewController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/18/21.
//

import UIKit

class CardViewController: UIViewController {
    private var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCollectionViewCell")

        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: collectionView.rightAnchor, constant: 16).isActive = true
    }
}

extension CardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 // TODO
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
//        cell.imageView.image = #imageLiteral(resourceName: "placeholder")
        return cell
    }
}

extension CardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

//        let cardView = viewModel.cards[indexPath.row]
//        cardView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(cardView)
//        cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        cardView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
//        view.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
//
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(cardTapped(_:)))
//        tapRecognizer.numberOfTapsRequired = 2
//        cardView.addGestureRecognizer(tapRecognizer)
        cardTapped()
    }

    @objc
    private func cardTapped() {
        let backCardView = BackCardView()
        backCardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backCardView)
        backCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backCardView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: backCardView.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: backCardView.rightAnchor).isActive = true
    }
}

private class CardCollectionViewCell: UICollectionViewCell {
    var cardView: ColorCodedCardView = {
        let view = ColorCodedCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cardView)
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
