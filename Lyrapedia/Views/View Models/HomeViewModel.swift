//
//  HomeViewModel.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/7/21.
//

import UIKit

class HomeViewModel {
    var cards: [Card] {
        return [
            Card(view: BasicCardView(), title: "Basic Card View"),
            Card(view: BasicPlusCardView(), title: "Basic Plus Card View"),
            Card(view: ColorCodedCardView(), title: "Color Coded Card View"),
            Card(view: ProgressionsCardView(), title: "Progressions Card View"),
            Card(view: BackCardView(), title: "Back Card View")
        ]
    }
}

struct Card {
    let view: UIView
    let title: String
}
