//
//  TipView.swift
//  FactAttack
//
//  Created by Bruno Agustin Caruso Fassa on 10.11.25.
//

import TipKit

struct TipView: Tip {
    var title = Text("Heads up! 🐱🐶🦆")
    var message: Text? = Text("The facts haven’t been verified, so take them with a grain of salt!")
    var image: Image? = Image(systemName: "info.bubble.fill")
}
