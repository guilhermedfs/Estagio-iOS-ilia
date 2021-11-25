//
//  Colors.swift
//  Desafio2(CII-2)
//
//  Created by Guilherme Silva on 24/11/21.
//


import UIKit

struct Colors {
    var colors: [String] = [
        "Black",
        "Purple",
        "Blue",
        "Yellow",
        "Green",
        "Pink",
        "Red"
    ]
    
    let colorsDict: [String:UIColor] = [
        "Black": .black,
        "Blue": .blue,
        "Green": .green,
        "Pink": .systemPink,
        "Purple": .purple,
        "Red": .red,
        "Yellow": .yellow
    ]
    
    let translateDict: [String:String] = [
        "Black": "preta",
        "Blue": "azul",
        "Green": "verde",
        "Pink": "rosa",
        "Purple": "roxa",
        "Red": "vermelha",
        "Yellow": "amarela"
    ]
    
    mutating func sortColorsAsc() {
        colors.sort()
        print(colors)
    }
    
    mutating func sortColorsDesc() {
        colors.sort { (lhs: String, rhs: String) -> Bool in
            return lhs > rhs
        }
        print(colors)
    }
    
    func getNumberOfColors() -> Int{
        return colors.count
    }
}

