//
//  CardController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/23/21.
//

import Foundation

class CardController {
    static func readLocalFile() -> [Card]? {
        if let path = Bundle.main.url(forResource: "cards", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let jsonData = try JSONDecoder().decode([Card].self, from: data)
                return jsonData
            } catch {
                print("decode error: \(error)")
            }
        }
        return nil
    }
}
