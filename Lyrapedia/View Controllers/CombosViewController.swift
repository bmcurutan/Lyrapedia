//
//  CombosViewController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 9/14/21.
//

import UIKit

class CombosViewController: UIViewController {
    private var viewModel = CardsViewModel()
    private var cards: [Card] = []

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .darkAccentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var headerView: ComboHeaderView = {
        let view = ComboHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .backgroundColor
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        headerView.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCollectionViewCell")

        titleLabel.text = viewModel.title
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true

        view.addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        view.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: 16).isActive = true

        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: collectionView.rightAnchor, constant: 16).isActive = true
    }
}

extension CombosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        let card = cards[indexPath.row]
        if let imageName = card.imageName {
            cell.imageView.image = UIImage(named: imageName)
            cell.imageView.alpha = 1
        } else {
            cell.imageView.image = #imageLiteral(resourceName: "placeholder")
            cell.imageView.alpha = 0.25
        }
        cell.titleLabel.text = card.title
        return cell
    }
}

extension CombosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimen = collectionView.frame.width
        return CGSize(width: dimen, height: dimen)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let cardViewController = CardViewController(cards: cards, index: indexPath.row)
        present(cardViewController, animated: true, completion: nil)
    }
}

extension CombosViewController: ComboHeaderViewDelegate {
    func generateButtonTapped() {
        let mountIndex = Int.random(in: 0..<viewModel.mounts.count)
        let poseIndex = Int.random(in: 0..<viewModel.poses.count)
        cards = [viewModel.mounts[mountIndex], viewModel.poses[poseIndex]]
        collectionView.reloadData() 
    }
}

protocol ComboHeaderViewDelegate {
    func generateButtonTapped()
}

private class ComboHeaderView: UIView {
    var delegate: ComboHeaderViewDelegate?

    private var posesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "# of Poses"
        label.textColor = .primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // TODO poses picker

    private var generateButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.backgroundColor = .primaryButtonColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("GENERATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
//        button.setTitleColor(.accentColor, for: .highlighted) // TODO
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(generateButton)
        generateButton.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        generateButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: generateButton.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: generateButton.rightAnchor).isActive = true
        generateButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        generateButton.addTarget(self, action: #selector(generateButtonTapped), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    private func generateButtonTapped() {
        delegate?.generateButtonTapped()
    }
}
