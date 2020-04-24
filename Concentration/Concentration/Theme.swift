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
}

class Theme {
    var ThemeDictionary = [String:singleTheme]()
    var ThemeTitle = [String](arrayLiteral: "Hallowen","Sports","Animals","Flags","People","Weather")
    
    init(){
        ThemeDictionary["Hallowen"]=singleTheme(emojis: ["🎃","👻","😈","💀","🙀","🍬","🍭","🍎"])
        ThemeDictionary["Sports"]=singleTheme(emojis: ["⚽️","🏀","⚾️","🥎","🎱","🏑","🥅","🥊"])
        ThemeDictionary["Animals"]=singleTheme(emojis: ["🐶","🐹","🦊","🐒","🐮","🐷","🐸","🐦"])
        ThemeDictionary["Flags"]=singleTheme(emojis: ["🇩🇿","🚩","🇦🇴","🇧🇧","🇦🇿","🇦🇱","🇧🇪","🇧🇹"])
        ThemeDictionary["People"]=singleTheme(emojis: ["😀","😄","🧐","🤪","😟","😋","😳","😠"])
        ThemeDictionary["Weather"]=singleTheme(emojis: ["☀️","🌤","💦","❄️","🔥","🌈","🌬","⛄️"])
    }
}


