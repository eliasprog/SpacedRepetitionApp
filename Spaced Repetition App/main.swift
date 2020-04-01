//
//  main.swift
//  Spaced Repetition App
//
//  Created by Kellyane Nogueira and Elias Ferreiraon 13/03/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

//Menu de opcoes
var ctrl: Bool = true
let cardDAO = CardDAO()

Scripts.updateCardsToStudy()

func showMenu() { //Shows a menu with options.
    print("-------------------------------------------------------")
    print(" Cards para estudar hoje: \(Scripts.getStudyCards())")
    print("=======================================================")
    print("                           MENU                        ")
    print("=======================================================")
    print(" 1 - Adiciona | 2 - Estudar | 3 - Listar | 0 - Sair  \n")
    print("Digite uma opção: ")
}

func estudar() {

    let cards = cardDAO.listarCards()
    

    

    for card in cards {

        

        if Scripts.isToday(dateString: card.nextStudyDay) {

            print(card.content)

            print("Classificar: ")
            print("0 - Não Aprendi | 1 - Aprendi | 2 - Revisar ")
            
            if let val = readLine() {
                if let valInt = Int(val) {

                    let day = Alg.classificate(val: valInt)
                    

                    let nextStudyDayUpdated = Scripts.incrementDate(data: card.nextStudyDay, val: day)

                    card.nextStudyDay = nextStudyDayUpdated

                }
            }
        }

    }

    cardDAO.saveCards(cards: cards)
}


while(ctrl) { // loop infinito, encerra quanto ctrl for '0'
    
    showMenu() //mostra o menu
    
    if let opt = readLine() { // le a opcao do usuario
        if let optInt = Int(opt) { // converto opt pra inteiro
            
            switch optInt {

            case 1:

                print("Digite a palavra: ")

                if let word = readLine() {
                    cardDAO.criarCard(word: word)
                }

            case 2:

                estudar()

                print("Estudando\n")
            case 3:
            
                let cards = cardDAO.listarCards()

                for card in cards {
                    print(card.content, card.nextStudyDay)
                }

            case 0:
                print("Saindo\n")
                ctrl = false
            default:
                print("Opção inválida!\n")
            }
            
        } else {
            print("Opção inválida! Digite um número inteiro!\n")
        }
    }
    
}

