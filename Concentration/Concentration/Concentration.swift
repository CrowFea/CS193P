//
//  Concentration.swift
//  Concentration
//
//  Created by 晨风 on 2020/4/23.
//  Copyright © 2020 crowfea. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    private(set) var theme = Theme()
    var curTheme = singleTheme(emojis: [""],cardColor: (0.0,0.0,0.0,0.0),bgColor: (0.0,0.0,0.0,0.0))
    
    var indexOneAndOnlyFaceUpCard : Int?
    
    private(set) var flipCount = 0
    private(set) var score = 0
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            flipCount += 1
            if let matchIndex = indexOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                }
                cards[index].isFaceUP = true
                indexOneAndOnlyFaceUpCard = nil
            }else if let matchIndex = indexOneAndOnlyFaceUpCard, matchIndex == index {
                flipCount -= 1
            }else {
                //either no cards or two cards face up
                for flipDownIndex in cards.indices {
                    if cards[flipDownIndex].firstFlip == false,cards[flipDownIndex].isFaceUP == true,cards[flipDownIndex].isMatched == false {
                        score -= 1
                    }else if cards[flipDownIndex].isFaceUP == true{
                        cards[flipDownIndex].firstFlip = false
                    }
                    cards[flipDownIndex].isFaceUP = false
                }
                cards[index].isFaceUP = true
                indexOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        let themeChoice = Int(arc4random()) % theme.ThemeTitle.count
        curTheme = theme.ThemeDictionary[theme.ThemeTitle[themeChoice]] ?? curTheme
        //TODO:shuffle the cards
        for i in 1..<cards.count {
            let index = Int(arc4random()) % i
            if index != i {
                cards.swapAt(i, index)
            }
        }
    }
}
