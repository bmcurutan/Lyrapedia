//
//  MountsViewController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 9/13/21.
//

import UIKit

class MountsViewController: CardsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = viewModel.mounts
    }
}
