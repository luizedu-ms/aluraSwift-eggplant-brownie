//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Luiz Mendes Silva on 21/01/22.
//

import Foundation
import UIKit


class RefeicoesTableViewController: UITableViewController{
    
    var refeicoes = [Refeicao(nome: "Macarrao", felicidade: 4),
                     Refeicao(nome: "Churros", felicidade: 3),
                     Refeicao(nome: "Comida Japonesa", felicidade: 1)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
    
    func add (_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewController = segue.destination as? ViewController{
            viewController.tableViewController = self
        }
        
        
    }
}
