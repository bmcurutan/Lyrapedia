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
        cardView.previousButton.isEnabled = index > 0 // TODO cleanup, buttons shouldn't be non-private
        cardView.nextButton.isEnabled = index < cards.count - 1

        view.addSubview(cardView)
        cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        cardView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
        cardView.imageView.addGestureRecognizer(recognizer)
    }

    @objc
    private func cardTapped() {
        let backCardView = BackCardView(card: cards[index], frontCardView: cardView)
        backCardView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(backCardView)
        backCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backCardView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: backCardView.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: backCardView.rightAnchor).isActive = true

        UIView.transition(from: backCardView,
                          to: backCardView,
                          duration: 0.6,
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion: nil)
    }
}

extension CardViewController: ColorCodedCardViewDelegate {
    func previousButtonTapped() {
        if index - 1 >= 0 {
            index -= 1
            cardView.card = cards[index]
        }
        cardView.previousButton.isEnabled = index > 0
        cardView.nextButton.isEnabled = index < cards.count - 1
    }

    func nextButtonTapped() {
        if index + 1 <= cards.count - 1 {
            index += 1
            cardView.card = cards[index]
        }
        cardView.previousButton.isEnabled = index > 0
        cardView.nextButton.isEnabled = index < cards.count - 1
    }
}
