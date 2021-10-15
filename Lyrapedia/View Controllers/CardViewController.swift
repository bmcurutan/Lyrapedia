//
//  CardViewController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/18/21.
//

import UIKit

class CardViewController: UIViewController { //}, ColorCodedCardViewDelegate {
    private let cards: [Card]
    private var index: Int

    private var cardView: ColorCodedCardView = {
        let view = ColorCodedCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(cards: [Card], index: Int) {
        self.cards = cards
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor

        cardView.card = cards[index]

        view.addSubview(cardView)
        cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        cardView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
    }
}
