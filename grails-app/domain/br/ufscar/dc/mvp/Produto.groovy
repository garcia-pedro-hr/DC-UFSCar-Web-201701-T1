package br.ufscar.dc.mvp

class Produto {

    static constraints = {
        nome(blank: false, size: 1..30)
        preco(blank: false, min: 0.1f)
        quantidade(blank: false, min: 0)
    }
    
    static mapping = {
        tablePerHierarchy false
    }
    
    String nome
    int quantidade
    float preco
    


}
