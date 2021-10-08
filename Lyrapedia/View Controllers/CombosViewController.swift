//
//  CombosViewController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 9/14/21.
//

import UIKit

// TODO tab bar icons
// TODO app logo
// Used as home page
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
        headerView.textField.placeholder = "1-\(viewModel.poses.count)"

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCollectionViewCell")

        titleLabel.text = viewModel.title
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true

        view.addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24).isActive = true
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
            cell.image = UIImage(named: imageName)
        }
        cell.title = card.title
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
        cardViewController.showNavigation = false
        present(cardViewController, animated: true, completion: nil)
    }
}

extension CombosViewController: ComboHeaderViewDelegate {
    func generateButtonTapped() {
        // # poses based on user input
        guard let text = headerView.textField.text else { return }

        // Only need to show one mount
        let mountIndex = Int.random(in: 0..<viewModel.mounts.count)
        cards = [viewModel.mounts[mountIndex]]

        if text.isEmpty {
            // Just show one pose
            let poseIndex = Int.random(in: 0..<viewModel.poses.count)
            cards.append(viewModel.poses[poseIndex])
        } else if let input = Int(text),
                  (1...viewModel.poses.count).contains(input) {
            var set: Set<Int> = []
            while set.count < input {
                set.insert(Int.random(in: 0...viewModel.poses.count - 1))
            }
            set.forEach {
                cards.append(viewModel.poses[$0])
            }
        } else {
            headerView.showErrorState()
            cards = []
        }
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
        label.text = "# of Poses:"
        label.textColor = .primaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var textField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.isUserInteractionEnabled = true
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.tintColor = .accentColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private var generateButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("GENERATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundColor(.primaryButtonColor, for: .normal)
        button.setBackgroundColor(.accentColor, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(textField)
        textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: centerXAnchor,constant: 4).isActive = true
        textField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 24).isActive = true

        addSubview(posesLabel)
        posesLabel.centerYAnchor.constraint(equalTo: textField.centerYAnchor).isActive = true
        centerXAnchor.constraint(equalTo: posesLabel.rightAnchor, constant: 4).isActive = true

        addSubview(generateButton)
        generateButton.topAnchor.constraint(equalTo: posesLabel.bottomAnchor, constant: 16).isActive = true
        generateButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: generateButton.bottomAnchor, constant: 16).isActive = true
        rightAnchor.constraint(equalTo: generateButton.rightAnchor).isActive = true
        generateButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        generateButton.addTarget(self, action: #selector(generateButtonTapped), for: .touchUpInside)

        addSubview(separator)
        separator.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: separator.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: separator.rightAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    private func generateButtonTapped() {
        showErrorState(false) // Reset state
        textField.resignFirstResponder()
        delegate?.generateButtonTapped()
    }

    func showErrorState(_ show: Bool = true) {
        textField.becomeFirstResponder()
        textField.layer.borderColor = show ? UIColor.accentColor.cgColor : UIColor.clear.cgColor
    }
}
