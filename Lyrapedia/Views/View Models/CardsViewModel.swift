//
//  CardsViewModel.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//

import UIKit

class CardsViewModel {
    var title = "Lyrapedia"

    var cards: [Card] {
        if let localData = CardController.readLocalFile() {
            CardController.parse(jsonData: localData)
        }
        return []
    }
}

struct Card: Codable {
    var title: String
//    var image: UIImage
}
