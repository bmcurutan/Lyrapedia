//
//  CardsViewModel.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//

import UIKit

class CardsViewModel {
    var title = "Lyrapedia"

    var cards: [Card] = CardController.readLocalFile() ?? []
}

struct CardSection: Codable {
    let section: String
    let cards: [Card]
}

struct Card: Codable {
    let title: String
    let imageName: String?
    let difficulty: Double?
    let description: [String]?
    // TODO fast follows
    let progressionsImageName: String?
    let progressions: [String]?
    let regressionsImageName: String?
    let regressions: [String]?
}
