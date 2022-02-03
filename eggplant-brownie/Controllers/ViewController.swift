//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Luiz Mendes Silva on 20/01/22.
//

import UIKit

//conhecido em outras linguagem como interface
protocol AdicionaRefeicaoDelegate{
    func add (_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate{
    
    
    // MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
//    var itens: [String] = ["Molho de Tomate", "Queijo", "Molho Apimentado", "Manjericao"]
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
//    @IBAction func adicionar(){
//
//    } forma manual para adicionar ação ao botão

    // MARK: - IBOutelets
    //forma pelo interfaceBuild (control arrasta)
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextFiel: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - View Life Cycle
    // adicionando item (Botao) no view controller programaticamente
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        recuperaItens()
    }
    
    func recuperaItens(){
        itens = ItemDao().recupera()
    }
    @objc func adicionarItem(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    func add(_ item: Item) {
        itens.append(item)
        ItemDao().save(itens)
        if let tableView = itensTableView{
            tableView.reloadData()
        }else {
            Alerta(controller: self).exibe(title: "Desculpe", mensagem: "Não foi possivel atualziar a tabela")
        }
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        celula.textLabel?.text = item.nome
        return celula
    }
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else {return}
        
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        }else{
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelecionados.index(of: item){
                itensSelecionados.remove(at: position)
            }
        }
    }
    
    func recuperaRefeicaoDoFormulario() -> Refeicao?{
        guard let nomeDaRefeicao = nomeTextField?.text else {            return nil
        }
        guard let felicidadeDaRefeicao = felicidadeTextFiel?.text, let felicidade = Int(felicidadeDaRefeicao) else {            return nil
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
            
        return refeicao
    }
    
    
    // MARK: - IBActions
    
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
       
        if let refeicao = recuperaRefeicaoDoFormulario(){
            delegate?.add(refeicao)
            navigationController?.popViewController(animated: true)
        } else {
            Alerta(controller: self).exibe(mensagem: "Erro ao ler dados do Fomulário")
        }

    }
}

