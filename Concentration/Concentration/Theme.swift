//
//  Theme.swift
//  Concentration
//
//  Created by 晨风 on 2020/4/24.
//  Copyright © 2020 crowfea. All rights reserved.
//

import Foundation

struct singleTheme {
    var emojis: [String]
    var cardColor:(Float,Float,Float,Float)
    var bgColor:(Float,Float,Float,Float)
}

class Theme {
    var ThemeDictionary = [String:singleTheme]()
    var ThemeTitle = [String](arrayLiteral: "Hallowen","Sports","Animals","Flags","People","Weather")
    
    init(){
        ThemeDictionary["Hallowen"]=singleTheme(emojis: ["🎃","👻","😈","💀","🙀","🍬","🍭","🍎"],cardColor: (0.2,0.3,0.4,1.0),bgColor: (1.0,0.0,0.0,1.0))
        ThemeDictionary["Sports"]=singleTheme(emojis: ["⚽️","🏀","⚾️","🥎","🎱","🏑","🥅","🥊"],cardColor: (0.6,0.3,0.4,1.0),bgColor: (0.0,1.0,0.0,1.0))
        ThemeDictionary["Animals"]=singleTheme(emojis: ["🐶","🐹","🦊","🐒","🐮","🐷","🐸","🐦"],cardColor: (0.2,0.7,0.4,1.0),bgColor: (0.0,0.0,1.0,1.0))
        ThemeDictionary["Flags"]=singleTheme(emojis: ["🇩🇿","🚩","🇦🇴","🇧🇧","🇦🇿","🇦🇱","🇧🇪","🇧🇹"],cardColor: (0.2,0.3,0.9,1.0),bgColor: (0.0,0.0,0.5,1.0))
        ThemeDictionary["People"]=singleTheme(emojis: ["😀","😄","🧐","🤪","😟","😋","😳","😠"],cardColor: (0.3,0.5,0.4,1.0),bgColor: (0.0,0.5,0.0,1.0))
        ThemeDictionary["Weather"]=singleTheme(emojis: ["☀️","🌤","💦","❄️","🔥","🌈","🌬","⛄️"],cardColor: (0.5,0.3,0.3,1.0),bgColor: (0.5,0.0,0.0,1.0))
    }
}


