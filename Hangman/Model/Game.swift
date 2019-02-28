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
    var correctGuesses: [String]
    var incorrectGuesses: [String]
    var userWordDisplay: String // current word state
    var originalUserWordDisplay: String // original word state
    
    init() {
        userWordDisplay = ""
        originalUserWordDisplay = ""
        counter = 1
        word = ""
        phrasesArray = []
        incorrectGuesses = []
        correctGuesses = []
        let phrasesObject = Phrases()
        if let pObject = phrasesObject.phrases as? [String] {
            phrasesArray = (pObject.shuffled())
            word = phrasesArray[0]
        }
        print(word)
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
    
    func setStartingWordDisplay() {
        userWordDisplay = ""
        originalUserWordDisplay = ""
        for char in word {
            if char != " " {
                userWordDisplay.append("-")
                originalUserWordDisplay.append("-")
            } else {
                userWordDisplay.append("  ")
                originalUserWordDisplay.append("  ")
            }
        }
    }
    
    func changeGuessWord() {
        let index: Int = Int.random(in: 0..<6)
        setWord(phrasesArray[index])
        setStartingWordDisplay()
    }
    
    func restart(_ changeWord: Bool) {
        if changeWord == true {
            changeGuessWord()
        }
        counter = 0
        incorrectGuesses = []
        correctGuesses = []
        userWordDisplay = originalUserWordDisplay
    }
    
    func checkLetter(_ letter: String) -> Bool {
        if word.contains(letter) {
            return true
        }
        return false
    }
}
