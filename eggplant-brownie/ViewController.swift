//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Luiz Mendes Silva on 20/01/22.
//

import UIKit

class ViewController: UIViewController {

//    @IBAction func adicionar(){
//
//    } forma manual para adicionar ação ao botão

    //forma pelo interfaceBuild (control arrasta)
    @IBOutlet var nomeTextField: UITextField!
    
    @IBOutlet var felicidadeTextFiel: UITextField!
    
    @IBAction func adicionar(_ sender: Any) {
        let nome = nomeTextField.text
        let felicidade = felicidadeTextFiel.text
        
        print("comi \(nome) e fiquei com felicidade:\(felicidade)")
    }
}

