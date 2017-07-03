package br.ufscar.dc.mvp

class Venda {
    static hasMany = [produtos: Produto]
    
    static constraints = {
        funcionario(nullable: false)
    }
    
    User funcionario
    
    String toString(){
        float precoTotal = 0
        for(i in this.produtos){
            precoTotal += i.preco
        }
        return "Venda: " + this.produtos.length() + "produtos, total: R\$" + precoTotal + ". Vendedor - " + funcionario.nome
    }
}
