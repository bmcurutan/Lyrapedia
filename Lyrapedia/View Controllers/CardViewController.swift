//
//  CardViewController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/18/21.
//

import UIKit

class CardViewController: UIViewController {
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
        view.backgroundColor = .white

        cardView.delegate = self
        cardView.card = cards[index]

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
        let backCardView = BackCardView(card: cards[index])
        backCardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backCardView)
        backCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backCardView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: backCardView.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: backCardView.rightAnchor).isActive = true
    }
}

extension CardViewController: ColorCodedCardViewDelegate {
    // TODO grey out buttons. shouldn't loop around
    
    func previousButtonTapped() {
        index -= 1
        if index < 0 {
            index = cards.count - 1 // Jump to end
        }
        cardView.card = cards[index]
    }

    func nextButtonTapped() {
        index += 1
        if index == cards.count {
            index = 0 // Reset
        }
        cardView.card = cards[index]
    }
}
