//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Luiz Mendes Silva on 21/01/22.
//

import UIKit

class Refeicao: NSObject, NSCoding{
   
   // MARK: - Atributos
        let nome: String
        let felicidade: Int
        var itens: Array<Item> = []
// MARK: - INIT
    init(nome: String, felicidade: Int, itens: [Item] = []){
            self.nome = nome
            self.felicidade = felicidade
            self.itens = itens
        }
// MARK: - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(felicidade, forKey: "felicidade")
        aCoder.encode(itens, forKey: "itens")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        felicidade = aDecoder.decodeInteger(forKey: "felicidade")
        itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>
        
    }
    
// MARK: - METODOS
        // METODO COM RETORNO
        func totalDeCalorias() -> Double {
            var total = 0.0

            for item in itens {
                total += item.calorias
            }
            return total
        }
    func detalhes()-> String{
        var menssagem = "Felicidade: \(felicidade)"
        
        for item in itens{
            menssagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return menssagem
    }
}
