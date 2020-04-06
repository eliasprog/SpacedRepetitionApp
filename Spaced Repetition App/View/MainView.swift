//
//  MainView.swift
//  Spaced Repetition App
//
//  Created by Elias Ferreira on 04/04/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation


class MainView {
    // Variaveis
    let controller: MainViewController
    
    init(controller: MainViewController) {
        self.controller = controller
    }
    
    // Funcao para limpar a tela
    func clear() {
        let p = Process()
        p.launchPath = "/usr/bin/clear"
        p.launch()
        p.waitUntilExit()
    }
    
    // Mostra o cabeçalho do menu.
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
    func menuAdicionar() {
        clear()
        print("Digite o assunto: ")
        if let word = readLine() {
            self.controller.adicionar(word: word)
            clear()
        } else {
            clear()
            print("Entrada inválida!")
        }
        
    }
    
    // Mostra um card na tela
    func mostrarCard(card: Card) {
        print("*--------------------------------------------*")
        print("|",card.content,terminator: "")
        for _ in (1...(30 - card.content.count)) {
            print(" ", terminator: "")
        }
         print("|",card.nextStudyDay,"|")
        print("*--------------------------------------------*")
    }
    
    // Solicita do usuário a classificao do card.
    func getClassificateValue(content: String) -> Int {
        var value = 0
        
        loop: while true {
            // Mostra o conteudo do card na tela.
            print("*------------------------------------------*")
            print("| Content: ", content, terminator: "")
            for _ in 1...(31 - content.count) {
                print(" ", terminator: "")
            }
            print("|")
            print("*------------------------------------------*")
            print("Classificar: ")
            print("0 - Não Aprendi | 1 - Revisar | 2 - Aprendi ")
            
            if let val = readLine(), let valInt = Int(val) {
                if valInt >= 0 && valInt < 3 {
                    value = valInt
                    clear()
                    break loop
                } else {
                    clear()
                    print("Opção inválida!")
                }
            } else {
                clear()
                print("Opção inválida!")
            }
        }
        return value
    }
    
    // Inicia a view na tela.
        func start() {
        clear()
        // Menu de opções.
        ctrl: while(true) {// loop infinito, encerra quanto ctrl for '0'
            
            showMenu() //mostra o menu
            
            if let opt = readLine(), let optInt = Int(opt) { // le a opcao do usuario
                 // converto opt pra inteiro
                switch optInt {

                case 1:
                    menuAdicionar()
                case 2:
                    clear()
                    self.controller.estudar()
                case 3:
                    clear()
                    self.controller.listar()
                case 0:
                    clear()
                    print("Bye, bye!!!\n")
                    break ctrl
                default:
                    clear()
                    print("Opção inválida!\n")
                }
                    
            } else {
                clear()
                print("Opção inválida! Digite um número inteiro!\n")
            }
        }
    
    }
}
