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
    
    var count: Int = 1
    let startImage = UIImage(named: "hangman1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hangmanImage.image = startImage
    }
    
    
    @IBOutlet weak var guessField: UITextField!
    
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
    
    func gameOver(_ rightAnswer: String) {
        let alertController = UIAlertController(title: "You Lost", message: "The right answer was " + rightAnswer, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

