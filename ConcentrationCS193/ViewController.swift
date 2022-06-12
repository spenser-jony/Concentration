//
//  ViewController.swift
//  ConcentrationCS193
//
//  Created by user on 12.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Concentration = Concentration(numberOfPairsOfCards: <#Int#>)

    var flipCount = 0 { didSet {flipCountLabel.text = "Flips: \(flipCount)"} }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    var emojiChoices = ["🎃","👻","🎃","👻"]

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor.orange
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = UIColor.white
        }
    }
}

