//
//  main.swift
//  Spaced Repetition App
//
//  Created by Kellyane Nogueira and Elias Ferreiraon 13/03/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

struct Main {
    // controller
    static let mainViewController = MainViewController()
    // view
    static let mainView = MainView(controller: mainViewController)
}
// start everything
Main.mainView.start()
