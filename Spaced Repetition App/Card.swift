//
//  Card.swift
//  Spaced Repetition App
//
//  Created by Kellyane Nogueira on 13/03/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

class Card {
    
    // Properties
    //var id: Int
    var content: String
    var nextStudyDay: Int
    
     //Init Method
    init(content: String, nextStudyDay: Int) {
        self.content = content
        self.nextStudyDay = nextStudyDay
    }
    
}
