//
//  MainViewController.swift
//  Spaced Repetition App
//
//  Created by Elias Ferreira on 04/04/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

class MainViewController {
    
    let cardDAO = CardDAO()
    
    func adicionar(word: String) {
        let card = Card(
            content: word,
            nextStudyDay: Scripts.stringToday()
        )
        
        self.cardDAO.saveCard(card: card)
    }
    
    func listar() {
        let cards = cardDAO.listarCards()
        for card in cards {
            Main.mainView.mostrarCard(card: card)
        }
    }
    
    // Funcao para estudar os cards.
    func estudar() {
        // lista de cards.
        let cards = self.cardDAO.listarCards()

        for card in cards { // percorre todos os cards.
            // Verifica se o card é para ser estudado na data atual.
            if Scripts.isToday(dateString: card.nextStudyDay) {

                let val = Main.mainView.getClassificateValue(content: card.content)
                // Chama o algoritimo de classificação por repetição espaçada.
                let days = Alg.classificate(val: val, lastDayIncremented: card.lastDaysIncremented)

                if (days[0] != 0) { // veririca se há valores a serem atualizados
                    // Atualiza os valores no card.
                    card.nextStudyDay = Scripts.incrementDate(data: card.nextStudyDay, val: days[0])
                    card.lastDaysIncremented = days[1]
                }

            }

        }
        // Solicita o salvamento da lista de cards no arquivo.
        cardDAO.saveCards(cards: cards)
    }
    
}
