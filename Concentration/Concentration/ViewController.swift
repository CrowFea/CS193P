//
//  ViewController.swift
//  Concentration
//
//  Created by 晨风 on 2020/4/23.
//  Copyright © 2020 crowfea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel(){
        //change color of card ;bg ;newGame Button;
        let color = UIColor.init(red: CGFloat(game.curTheme.cardColor.0), green: CGFloat(game.curTheme.cardColor.1), blue: CGFloat(game.curTheme.cardColor.2), alpha: CGFloat(game.curTheme.cardColor.3))
        self.view.backgroundColor = UIColor.init(red: CGFloat(game.curTheme.bgColor.0), green: CGFloat(game.curTheme.bgColor.1), blue: CGFloat(game.curTheme.bgColor.2), alpha: CGFloat(game.curTheme.bgColor.3))
        newGameButton.backgroundColor = color
        newGameButton.setTitleColor(self.view.backgroundColor, for: UIControl.State.normal)
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUP{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0) : color
            }
        }
        flipCountLabel.text = "Flips : \(game.flipCount)"
        flipCountLabel.textColor = color
        ScoreLabel.text = "Scores : \(game.score)"
        ScoreLabel.textColor = color
    }
    
    lazy var emojiChoices = game.curTheme.emojis
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBAction func newGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        emojiChoices = game.curTheme.emojis
        emoji = [Int:String]()
        updateViewFromModel()
    }
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBOutlet weak var ScoreLabel: UILabel!
}

