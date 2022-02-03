//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Luiz Mendes Silva on 01/02/22.
//

import UIKit


class Alerta{
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    // devinindo um valor padrao para passar
    func exibe(title: String = "Atenção", mensagem: String){
        let alerta = UIAlertController(title: title, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
