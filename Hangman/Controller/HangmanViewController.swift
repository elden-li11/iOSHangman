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
        guessField.attributedPlaceholder = NSAttributedString(string: "Enter guess here: ",
                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        game.setStartingWordDisplay()
        hangmanImage.image = startImage
        puzzelWord.text = game.userWordDisplay
    }
    
    @IBOutlet weak var puzzelWord: UILabel!
    @IBOutlet weak var incorrectGuesses: UILabel!
    @IBOutlet weak var guessField: UITextField!
    
    @IBAction func guessFieldPressed(_ sender: Any) {
        guessField.becomeFirstResponder()
    }
    
    //Responds to the Guess Button being pressed, updating hangman or the wod
    @IBAction func guessPressed(_ sender: Any) {
        if guessField.text!.count != 1 {
            invalidInputAlert()
        } else {
            guessField.text! = guessField.text!.lowercased()
            if game.checkLetter(guessField.text!) {
                correctLetterInputed(guessField.text!)
            } else {
                wrongLetterInputed(guessField.text!)
            }
        }
        guessField.text = ""
    }
    
    //Restarts the game
    func restart(_ changeWord: Bool) {
        game.restart(changeWord)
        incorrectGuesses.text = "Incorrect guesses: "
        puzzelWord.text = game.originalUserWordDisplay
        hangmanImage.image = startImage
    }
    
    //Resets the game upon the restart button press
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        restart(false)
    }
    
    //When the user wins
    func win() {
        let alertController = UIAlertController(title: "You won", message: "The word is: " + game.word + ".", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    //When the user guesses wrong 7 times
    func gameOver(_ rightAnswer: String) {
        let alertController = UIAlertController(title: "Hangman Died", message: "Try Again", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Restart", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    //Alert for when the user inputs an invalid guess
    func invalidInputAlert() {
        let alertController = UIAlertController(title: "Invalid Input", message: "You must enter one single letter.", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    //User inputs a character they have already guessed
    func repeatedInputAlert() {
        let alertController = UIAlertController(title: "Again?", message: "You entered this letter already.", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    //Does shit when the user inputs a correct guess
    func correctLetterInputed(_ letter: String) {
        if !game.correctGuesses.contains(letter) {
            var tempWordDisplay: String = ""
            for char in game.word {
                if game.correctGuesses.contains(String(char)) {
                    tempWordDisplay.append(char)
                } else if String(char) == letter {
                    tempWordDisplay.append(char)
                    game.correctGuesses.append(String(char))
                } else if String(char) == " " {
                    tempWordDisplay.append(char)
                } else {
                    tempWordDisplay.append("-")
                }
            }
            game.userWordDisplay = tempWordDisplay
            puzzelWord.text = game.userWordDisplay
            
            if game.userWordDisplay == game.word {
                win()
                restart(true)
            }
        }
    }
    
    //Does shit when the user inputs an incorrect guess
    func wrongLetterInputed(_ letter: String) {
        if game.incorrectGuesses.contains(letter) {
            repeatedInputAlert()
        } else {
            if game.loseAGuess() == false {
                hangmanImage.image = UIImage(named: "hangman" + String(game.counter))
                gameOver(game.word)
                restart(false)
            } else {
                hangmanImage.image = UIImage(named: "hangman" + String(game.counter))
                game.incorrectGuesses.append(letter)
                incorrectGuesses.text = incorrectGuesses.text! + " " + letter
            }
        }
    }
}
