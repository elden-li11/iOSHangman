//
//  HangmanViewController
//  Hangman
//
//  Created by David [Entei] Xiong on 2/19/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var puzzleWord: UILabel!
    
    var count: Int = 1
    let game = Game()
    let startImage = UIImage(named: "hangman1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hangmanImage.image = startImage
        puzzelWord.text = game.userWordDisplay
        guessField.text = ""
    }
    
    @IBOutlet weak var puzzelWord: UILabel!
    @IBOutlet weak var incorrectGuesses: UILabel!
    @IBOutlet weak var guessField: UITextField!
    
    //Responds to the Guess Button being pressed, updating hangman or the wod
    @IBAction func guessPressed(_ sender: Any) {
        if guessField.text!.count != 1 {
                invalidInputAlert()
        } else {
            if checkLetter(guessField.text!) {
                print("RIGHT")
                // replace the dashes with letter
            } else {
                print("WRONG")
                wrongLetterInputed(guessField.text!)
            }
        }
    }
    
    //Restarts the game
    func restart() {
        game.counter = 0
        hangmanImage.image = startImage
        game.incorrectGuesses = []
        incorrectGuesses.text = "Incorrect guesses: "
        puzzelWord.text = game.originalUserWordDisplay
        hangmanImage.image = startImage
    }
    
    //Resets the game upon the restart button press
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        restart()
    }
    
    //Checks if the users input matches a letter in the phrase
    func checkLetter(_ letter: String) -> Bool {
        if (game.word.contains(letter)) {
            return true
        }
        return false
    }
    
    //When the user guesses wrong 7 times
    func gameOver(_ rightAnswer: String) {
        let alertController = UIAlertController(title: "Hangman Died", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Restart", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    //Alert for when the user inputs an invalid guess
    func invalidInputAlert() {
        let alertController = UIAlertController(title: "Invalid Input", message: "You must enter one single letter.", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func repeatedInputAlert() {
        let alertController = UIAlertController(title: "Again?", message: "You entered this letter already.", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    //Does shit when the user inputs an incorrect guess
    func wrongLetterInputed(_ letter: String) {
        if (game.incorrectGuesses.contains(letter)) {
            repeatedInputAlert()
        } else {
            if game.loseAGuess() == false {
                hangmanImage.image = UIImage(named: "hangman" + String(game.counter))
                gameOver(game.word)
                restart()
            } else {
                hangmanImage.image = UIImage(named: "hangman" + String(game.counter))
                game.incorrectGuesses.append(letter)
                incorrectGuesses.text = incorrectGuesses.text! + " " + letter
            }
        }
    }
}
