package br.ufscar.dc.mvp

class Venda {
    //static hasMany = [produtos: Produto]
    
    static constraints = {
        funcionario(nullable: false)
        produto(nullable: false)
        quantidade(blank: false, min: 1)
    }
    
    User funcionario
    Produto produto
    int quantidade
    
    String toString(){
        //float precoTotal = produto.getPreco() * quantidade
        return "Venda: " + quantidade + " " + ", total: R\$" +  ". Vendedor - " + funcionario.toString()
    }
}
