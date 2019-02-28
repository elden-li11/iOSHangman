//
//  Phrases.swift
//  Hangman
//
//  Created by Arman Vaziri on 2/27/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation

class Phrases {
    
    var phrases : NSArray!
    
    init() {
        // Replace "phrases" with your plist's filename
        let path = Bundle.main.path(forResource: "phrases", ofType: "plist")
        phrases = NSArray.init(contentsOfFile: path!)
    }
    
}
