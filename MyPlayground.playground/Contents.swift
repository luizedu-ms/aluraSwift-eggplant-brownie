import UIKit
//// comentário
//
///* comentarios
// 0-jkjkjkjmmas
//
// */
//let nome = "churros"
//let felicidade: Int = 5
//let calorias: Double = 79.5
//let vegetal:  Bool = false
////
////func alimentoConsumido(){
////    print("O alimento consumido foi: \(nome)")
////}
////alimentoConsumido()
//
////func alimentoConsumido(_ nome: String, _ caloria: Double){
////    print("O alimento consumido foi: \(nome), com calorias: \(caloria)")
////}
////
////alimentoConsumido(nome,calorias)
//
//func alimentoConsumido(nome: String,caloria: Double){
//    print("O alimento consumido foi: \(nome), com calorias: \(caloria)")
//}
//alimentoConsumido(nome:nome,caloria:calorias)
//
////Array
//
//let totaldeCalorias = [50.5, 100, 300, 500, 400]
//
//print(totaldeCalorias)
//
////for
//for i in 0...3{
//    print(i)
//    print(totaldeCalorias[i])
//}
//
//// segunda forma pro for
//
//for i in 0...totaldeCalorias.count-1{
//    print(i)
//    print(totaldeCalorias[i])
//}
//
////terceira forma do for
//
//for caloria in totaldeCalorias {
//    print(caloria)
//}
//
//let totaldeCal = [50.5, 100]
//
//func todasCalorias (totaldeCal: Array<Double> /*[Double]*/) -> Double{
//    var total: Double = 0
//
//    for cal in totaldeCal{
//        total += cal
//    }
//    return total
//}
//
//let total = todasCalorias(totaldeCal: [50.5, 100, 400])
//
//print(total)


////Criar a primeiro refeição
//let nome:String = "Macarrão"
//let felicidade:String = "5"
//
////Criar a segunda refeição
//let nome1:String = "Churros"
//let felicidade1:String = "4"
////--------------------------

//Criar uma classe que agrupe essas caractericas

//class Refeicao{
//var nome:String? //<-- ! (Forced unwrap) da certeza que vai passar valor (Pode dar erro, nao utilizar) ou ? (Optinals) pode ou nao ter valores
//var feliciadade:String?
//}
////Instanciando uma classe:
////let refeicao = Refeicao()
//let refeicao: Refeicao = Refeicao()
//refeicao.nome = "macarrao"
//
////print(refeicao.nome)
//
//if refeicao.nome != nil {
//    print(refeicao.nome!)
//}
//
////Boas práticas para extrair valores opcionais:
//
//if let nome = refeicao.nome {
//    print(nome)
//}
////guard let
//
//func exibeNomeDaRefeicao(){
//    if let nome = refeicao.nome {
//    print(nome)
//    }
//    guard let nome = refeicao.nome else {
//        return
//    }
//    print(nome)
//}
//exibeNomeDaRefeicao()

class Refeicao {
    var nome: String
    var felicidade: String
    var itens: Array<Item> = []

    init(nome: String, felicidade: String){
        self.nome = nome
        self.felicidade = felicidade
    }

    func totalDeCalorias() -> Double {
        var total = 0.0

        for item in itens {
            total += item.calorias
        }

        return total
    }
}
class Item {
    var nome: String
    var calorias: Double

    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}

let arroz = Item(nome: "Arroz", calorias: 51.0)
let feijao = Item(nome: "Feijão", calorias: 90.0)
let contraFile = Item(nome: "Contra Filé", calorias: 287.0)

let refeicao = Refeicao(nome: "Almoço", felicidade: "5")
refeicao.itens.append(arroz)
refeicao.itens.append(feijao)
refeicao.itens.append(contraFile)

print(refeicao.nome)
if let primeiroItemDaLista = refeicao.itens.first {
    print(primeiroItemDaLista.nome)
}
print(refeicao.totalDeCalorias())
