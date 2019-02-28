//
//  Game.swift
//  Hangman
//
//  Created by Elden Li on 2/27/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation

class Game {
    var counter: Int
    var word: String
    
    init() {
        counter = 1
        word = ""
    }
    
    func loseAGuess() -> Bool {
        counter += 1
        if (counter == 7) {
            return false
        }
        return true
    }
    
    func setWord(_ word: String) {
        self.word = word
    }
}
