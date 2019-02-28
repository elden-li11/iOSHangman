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
    }
    
    @IBOutlet weak var puzzelWord: UILabel!
    
    @IBOutlet weak var guessField: UITextField!
    
    //Responds to the Guess Button being pressed, updating hangman or the wod
    @IBAction func guessPressed(_ sender: Any) {
        let gameState: Bool = game.loseAGuess()
        hangmanImage.image = UIImage(named: "hangman" + String(game.counter))
        if (gameState == false) {
            gameOver("Cheesecake")
            restart()
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
        let alertController = UIAlertController(title: "You Lost", message: "The right answer was " + rightAnswer, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Restart", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
