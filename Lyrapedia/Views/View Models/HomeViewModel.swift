//
//  HomeViewModel.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//

import UIKit

class HomeViewModel {
    var title = "Lyrapedia"

    var cards: [Card] {
        return [
            Card(view: ColorCodedCardView(), title: "Color Coded Card View"),
            Card(view: ColorCodedCardView(), title: "Color Coded Card View"),
            Card(view: ColorCodedCardView(), title: "Color Coded Card View"),
            Card(view: ColorCodedCardView(), title: "Color Coded Card View"),
            Card(view: ColorCodedCardView(), title: "Color Coded Card View")
        ]
    }
}

struct Card {
    let view: UIView
    let title: String
}
