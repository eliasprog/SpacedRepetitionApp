//
//  CardDAO.swift
//  Spaced Repetition App
//
//  Created by Kellyane Nogueira on 13/03/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

class CardDAO {
    //variaveis
    let home: URL
    let fileUrl: URL
    
    // Initializer
    init() {
        // Directory home
        home = FileManager.default.homeDirectoryForCurrentUser
        // Url to the file.
        fileUrl = home.appendingPathComponent("Documents/.dados.json")
        // It creates the file if the same doesn`t exists.
        if (!FileManager.default.fileExists(atPath: fileUrl.path)) {
            do {
                let jsonData = try JSONEncoder().encode([Card]())
                try jsonData.write(to: fileUrl)
            } catch {
                print("Impossível escrever no arquivo.")
            }
        }
    }

    // function to add an card
    func saveCard(card: Card) {
        var cards = self.listarCards()
        cards.append(card)
        do {
            let data = try JSONEncoder().encode(cards)
            try data.write(to: fileUrl)
        }
        catch {
            print(error.localizedDescription)
        }
    }

    // function to save cards.
    func saveCards(cards: [Card]) {
        do {
            let data = try JSONEncoder().encode(cards)
            try data.write(to: fileUrl)
        }
        catch {
            print(error.localizedDescription)
        }
    }

    // function to list the cards.
    func listarCards() -> [Card] {
        var cards = [Card]()
        do {
            let data = try Data(contentsOf: fileUrl)
            cards = try JSONDecoder().decode([Card].self, from: data)
        }
        catch {
            print(error.localizedDescription)
        }
        
        return cards
    }
    
}
