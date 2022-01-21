//
//  Item.swift
//  eggplant-brownie
//
//  Created by Luiz Mendes Silva on 21/01/22.
//

import UIKit

class Item: NSObject {
    //Atributos
    let nome: String
    let calorias: Double
    //Init -  Contrutor
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
