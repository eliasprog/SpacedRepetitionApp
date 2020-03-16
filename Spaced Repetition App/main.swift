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
                print("Estudando\n")
            case 3:
                let cards: [Card] = obj.listarCards()
                for card in cards{
                    print(card.content)
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

