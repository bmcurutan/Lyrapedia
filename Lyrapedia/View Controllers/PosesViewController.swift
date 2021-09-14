//
//  PosesViewController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 9/13/21.
//

import UIKit

class PosesViewController: CardsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = viewModel.poses
    }
}
