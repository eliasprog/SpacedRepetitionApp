//
//  main.swift
//  Spaced Repetition App
//
//  Created by Kellyane Nogueira and Elias Ferreiraon 13/03/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

// Variaveis
var ctrl: Bool = true
let cardDAO = CardDAO()

/**
 *Atualiza os cards não estudados anteriormente
 * para serem estudados na data atual.
 */
Scripts.updateCardsToStudy()

//Shows a menu with options.
func showMenu() {
    print("-------------------------------------------------------")
    // Mostra a quantidade de cards a serem estudados hoje.
    print(" Cards para estudar hoje: \(Scripts.getStudyCards())") 
    print("=======================================================")
    print("                           MENU                        ")
    print("=======================================================")
    print(" 1 - Adiciona | 2 - Estudar | 3 - Listar | 0 - Sair  \n")
    print("Digite uma opção: ")
}

// Função para adicao de cards.
func adicionar() {
    system("clear")
    print("Digite a palavra: ")

    if let word = readLine() { // Lê o dado do usuario.
        cardDAO.criarCard(word: word) // Solicita o salvamento.
    }
    system("clear")
}

// Função para listar cards na tela.
func listar() {
    system("clear")
    // Solicita a lista de cards
    let cards = cardDAO.listarCards()

    for card in cards { // Percorre todos os cards.
        print(card.content, card.nextStudyDay) // Mostra cada card na tela.
    }
}

// Funcao para estudar os cards.
func estudar() {
    system("clear")
    // lista de cards.
    let cards = cardDAO.listarCards()

    for card in cards { // percorre todos os cards.
        system("clear")
        // Verifica se o card é para ser estudado na data atual.
        if Scripts.isToday(dateString: card.nextStudyDay) {

            // Mostra o conteudo do card na tela.
            print("-------------------------------------------------------")
            print("    ",card.content)
            print("-------------------------------------------------------")
           /**Faz a classificação do card estudado
            * de acordo com a dificuldade.
            */
            print("Classificar: ")
            print("0 - Não Aprendi | 1 - Revisar | 2 - Aprendi ")
            
            if let val = readLine() { // Lê a opção do usuário.
                if let valInt = Int(val) { // Converte para inteiro.

                    // Chama o algoritimo de classificação por repetição espaçada.
                    let days = Alg.classificate(val: valInt, lastDayIncremented: card.lastDaysIncremented)

                    if (days[0] != 0) { // veririca se há valores a serem atualizados
                        // Atualiza os valores no card.
                        card.nextStudyDay = Scripts.incrementDate(data: card.nextStudyDay, val: days[0])
                        card.lastDaysIncremented = days[1]
                    }
                    
                }
            }

        }

    }
    // Solicita o salvamento da lista de cards no arquivo.
    cardDAO.saveCards(cards: cards)
    system("clear")
}

system("clear")
// Menu de opções.
while(ctrl) {// loop infinito, encerra quanto ctrl for '0'
    
    showMenu() //mostra o menu
    
    if let opt = readLine() { // le a opcao do usuario
        if let optInt = Int(opt) { // converto opt pra inteiro
            
            switch optInt {

            case 1:
                adicionar()

            case 2:
                estudar()

            case 3:
                listar()

            case 0:
                system("clear")
                print("Bye, bye!!!\n")
                ctrl = false

            default:
                system("clear")
                print("Opção inválida!\n")

            }
            
        } else {
            system("clear")
            print("Opção inválida! Digite um número inteiro!\n")
        }
    }
    
}
