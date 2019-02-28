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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let startImage = UIImage(named: "hangman1")
        hangmanImage.image = startImage
    }
    

    @IBOutlet weak var guessField: UITextField!
    
    @IBAction func guessPressed(_ sender: Any) {
        
    }
}

