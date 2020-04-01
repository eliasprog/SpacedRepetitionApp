//
//  Card.swift
//  Spaced Repetition App
//
//  Created by Kellyane Nogueira on 13/03/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

class Card: Codable {
    
    // Properties
    //var id: Int
    var content: String
    var nextStudyDay: String
    
     //Init Method
    init(content: String, nextStudyDay: String) {
        self.content = content
        self.nextStudyDay = nextStudyDay
    }
    
}
