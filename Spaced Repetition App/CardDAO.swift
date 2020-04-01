//
//  CardDAO.swift
//  Spaced Repetition App
//
//  Created by Kellyane Nogueira on 13/03/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

class CardDAO{
    //variaveis
    let fileManager: FileManager
    let home: URL
    let fileUrl: URL
    
    init() { // init method
        fileManager = FileManager.default
        home = fileManager.homeDirectoryForCurrentUser
        //fileUrl = home.appendingPathComponent("Desktop/Projetos/SPA/dados.json")
        fileUrl = home.appendingPathComponent("SwiftProjects/SpacedRepetitionApp/dados.json")
    }

    // function to add an card
    func addCard(card: Card) {
        var cards = self.listarCards()
        cards.append(card)
        let data = try! JSONEncoder().encode(cards)
        try! data.write(to: fileUrl)
    }

    // function to save cards.
    func saveCards(cards: [Card]) {
        let data = try! JSONEncoder().encode(cards)
        try! data.write(to: fileUrl)
    }

    // function to list the cards.
    func listarCards() -> [Card] {
        let data = try! Data(contentsOf: fileUrl)
        let cards = try! JSONDecoder().decode([Card].self, from: data)
        //self.cards = cards
        return cards
    }

    // function to create a card.
    func criarCard(word: String) {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        let nowString = dateFormatter.string(from: now)
    
        let card = Card(content: word, nextStudyDay: nowString) //Default
        self.addCard(card: card)
    }
    
}
