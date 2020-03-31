//
//  CardDAO.swift
//  Spaced Repetition App
//
//  Created by Kellyane Nogueira on 13/03/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

class CardDAO{
    
    private var cards = [Card]()
    let fileManager: FileManager
    let home: URL
    let fileUrl: URL
    
    init() {
        fileManager = FileManager.default
        home = fileManager.homeDirectoryForCurrentUser
        fileUrl = home.appendingPathComponent("Desktop/Projetos/SPA/dados.json")
    }
    
    func saveCards(card: Card){
        cards.append(card)
        let data = try! JSONEncoder().encode(cards)
        try! data.write(to: fileUrl)
    }
    
    func listarCards() -> [Card] {
        let data = try! Data(contentsOf: fileUrl)
        let cards = try! JSONDecoder().decode([Card].self, from: data)
        return cards
    }
    
    
}
