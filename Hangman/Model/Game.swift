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
    var phrasesArray: [String]
<<<<<<< HEAD
    var incorrectGuesses: [String]
=======
    var userWordDisplay: String
>>>>>>> 7474244aac9c67d80f708aad83f6cd5492b59937
    
    init() {
        userWordDisplay = ""
        counter = 1
        word = ""
        phrasesArray = []
        incorrectGuesses = []
        let phrasesObject = Phrases()
        if let pObject = phrasesObject.phrases as? [String] {
            phrasesArray = (pObject.shuffled())
            word = phrasesArray[0]
        }
        for index in word.characters.indices {
            if word[index] != " " {
                userWordDisplay = userWordDisplay + "-"
            } else {
                userWordDisplay = userWordDisplay + " "
            }
        }
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
