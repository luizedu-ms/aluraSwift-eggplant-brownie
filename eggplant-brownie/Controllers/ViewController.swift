//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Luiz Mendes Silva on 20/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    var tableViewController: RefeicoesTableViewController?

//    @IBAction func adicionar(){
//
//    } forma manual para adicionar ação ao botão

    //forma pelo interfaceBuild (control arrasta)
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextFiel: UITextField?
    
    @IBAction func adicionar(_ sender: Any) {
        
//        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextFiel?.text{
//            let nome = nomeDaRefeicao
//            if let felicidade = Int(felicidadeDaRefeicao){
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//                print("comi \(refeicao.nome) e fiquei com felicidade:\(refeicao.felicidade)")
//            } else{
//                print("Erro ao criar refeicao")
//            }
//
//        }
       
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        guard let felicidadeDaRefeicao = felicidadeTextFiel?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        print("comi \(refeicao.nome) e fiquei com felicidade:\(refeicao.felicidade)")
        
        
        tableViewController?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
        
    }
}

