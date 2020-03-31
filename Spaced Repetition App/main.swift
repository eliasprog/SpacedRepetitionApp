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

let obj = CardDAO()

func showMenu() { //Shows a menu with options.
    print("-------------------------------------------------------")
    print("                           MENU                        ")
    print("=======================================================")
    print(" 1 - Adiciona | 2 - Estudar | 3 - Listar | 0 - Sair  \n")
    print("Digite uma opção: ")
}



while(ctrl) { // loop infinito, encerra quanto ctrl for '0'
    
    showMenu() //mostra o menu
    
    if let opt = readLine() { // le a opcao do usuario
        if let optInt = Int(opt) { // converto opt pra inteiro
            
            switch optInt {
            case 1:

                let card = Card(content: "portugues", nextStudyDay: 0)
                obj.addCard(card: card)

            case 2:

                let cards = obj.listarCards()

                for card in cards {

                    if card.nextStudyDay == 0 {
                        print(card.content)

                        print("Classificar: ")
                        print("0 - Errei | 1 - Acertei | 2 - Fácil ")
                        
                        if let val = readLine() {
                            if let valInt = Int(val) {
                                card.nextStudyDay = Alg.classificate(nextStudyDay: card.nextStudyDay, val: valInt)
                            }
                        }
                    }

                }

                obj.saveCards(cards: cards)

                print("Estudando\n")
            case 3:
            
                let cards = obj.listarCards()

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

