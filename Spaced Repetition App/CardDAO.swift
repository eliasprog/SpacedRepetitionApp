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
    
    func addCard(card: Card) {
        cards.append(card)
    }
    
    func listarCards() -> [Card] {
        return cards
    }
    
}
