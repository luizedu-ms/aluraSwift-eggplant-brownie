//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Luiz Mendes Silva on 02/02/22.
//

import UIKit


class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
            
        let alerta = UIAlertController (title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)

        let botaoCancelar = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
    
        alerta.addAction(botaoCancelar)
    
        let botaoRemover = UIAlertAction(title: "remover", style: .destructive, handler: handler)
        
        alerta.addAction(botaoRemover)
        controller.present(alerta, animated: true, completion: nil)
            // configurar algo completion : (() -> Voi)?
    }
}
