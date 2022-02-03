//
//  Item.swift
//  eggplant-brownie
//
//  Created by Luiz Mendes Silva on 21/01/22.
//

import UIKit

class Item: NSObject, NSCoding{
    
    
    //Atributos
    let nome: String
    let calorias: Double
    //Init -  Contrutor
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        calorias = aDecoder.decodeDouble(forKey: "calorias")
    }
}
