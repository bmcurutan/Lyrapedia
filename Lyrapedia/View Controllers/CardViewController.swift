//
//  CardViewController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/18/21.
//

import UIKit

class CardViewController: UIViewController {
    private let card: Card

    init(card: Card) {
        self.card = card
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let cardView = ColorCodedCardView(card: card)
        cardView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(cardView)
        cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        cardView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
        cardView.addGestureRecognizer(recognizer)
    }

    @objc
    private func cardTapped() {
        let backCardView = BackCardView(card: card)
        backCardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backCardView)
        backCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backCardView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: backCardView.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: backCardView.rightAnchor).isActive = true
    }
}

