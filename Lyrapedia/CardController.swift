//
//  CardController.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 6/23/21.
//

import Foundation

class CardController {
    static func readLocalFile() -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "cards", ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }

    static func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(Card.self, from: jsonData)
            print("Title: ", decodedData.title)
        } catch {
            print("decode error")
        }
    }
}
