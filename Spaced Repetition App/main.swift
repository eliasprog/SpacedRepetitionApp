//
//  main.swift
//  Spaced Repetition App
//
//  Created by Kellyane Nogueira and Elias Ferreiraon 13/03/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation
@available(OSX 10.12, *)

struct Main {
    // controller
    static let mainViewController = MainViewController()
    // view
    static let mainView = MainView(controller: mainViewController)
}
// start everything
if #available(OSX 10.12, *){
    Main.mainView.start()
}else{
    print("Sorry, esta versão não é compatível!")
}
