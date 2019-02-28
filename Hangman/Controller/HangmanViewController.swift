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
    let startImage = UIImage(named: "hangman1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hangmanImage.image = startImage
        
    }
    
    var phrases : NSArray!
    
    init() {
        // Replace "phrases" with your plist's filename
        let path = Bundle.main.path(forResource: "phrases", ofType: "plist")
        phrases = NSArray.init(contentsOfFile: path!)
    }
    
    @IBOutlet weak var guessField: UITextField!
    
    func textFieldBeganEditing(textField: UITextField) {
        
    }
    
    @IBAction func guessPressed(_ sender: Any) {
        self.count += 1
        hangmanImage.image = UIImage(named: "hangman" + String(count))
        if (count == 7) {
            gameOver("Cheesecake")
            restart()
        }
    }
    
    func restart() {
        count = 0
        hangmanImage.image = startImage
    }
    
    //Resets the game.
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        restart()
    }
    
    
    func gameOver(_ rightAnswer: String) {
        let alertController = UIAlertController(title: "You Lost", message: "The right answer was " + rightAnswer, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Restart", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
