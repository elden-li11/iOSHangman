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
            if checkLetter(game.word) {
                // replace the dashes with letter
            } else {
                
            }
        }
    }
    
    func restart() {
        game.counter = 0
        hangmanImage.image = startImage
    }
    
    //Resets the game.
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        restart()
    }
    
    func checkLetter(_ letter: String) -> Bool {
        if (game.word.contains(letter)) {
            return true
        }
        return false
    }
    
    func gameOver(_ rightAnswer: String) {
        let alertController = UIAlertController(title: "You Lost", message: "The right answer was " + game.word + ".", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Restart", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
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
    
    func wrongLetterInputed(_ letter: String) {
        if (game.incorrectGuesses.contains(letter)) {
            repeatedInputAlert()
        } else {
            game.incorrectGuesses.append(letter)
        }
    }
}
