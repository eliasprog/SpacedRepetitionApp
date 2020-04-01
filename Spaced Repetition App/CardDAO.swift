//
//  CardDAO.swift
//  Spaced Repetition App
//
//  Created by Kellyane Nogueira on 13/03/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

class CardDAO{
    
    //private var cards = [Card]()
    let fileManager: FileManager
    let home: URL
    let fileUrl: URL
    
    init() {
        fileManager = FileManager.default
        home = fileManager.homeDirectoryForCurrentUser
        //fileUrl = home.appendingPathComponent("Desktop/Projetos/SPA/dados.json")
        fileUrl = home.appendingPathComponent("SwiftProjects/SpacedRepetitionApp/dados.json")
    }
    
    func addCard(card: Card) {
        var cards = self.listarCards()
        cards.append(card)
        let data = try! JSONEncoder().encode(cards)
        try! data.write(to: fileUrl)
    }

    func saveCards(cards: [Card]) {
        let data = try! JSONEncoder().encode(cards)
        try! data.write(to: fileUrl)
    }

    
    func listarCards() -> [Card] {
        let data = try! Data(contentsOf: fileUrl)
        let cards = try! JSONDecoder().decode([Card].self, from: data)
        //self.cards = cards
        return cards
    }

    func criarCard(word: String) {

        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        let nowString = dateFormatter.string(from: now)
    
        let card = Card(content: word, nextStudyDay: nowString) //Default
        self.addCard(card: card)
    }
    
}
