//
//  ViewController.swift
//  ConcentrationCS193
//
//  Created by user on 12.06.2022.
//

import UIKit

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }

   private (set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            if !game.cards[cardNumber].isMatched {
                flipCount += 1
            }
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.black : UIColor.orange
            }
        }
    }
    
    private var emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]

    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emoji.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

