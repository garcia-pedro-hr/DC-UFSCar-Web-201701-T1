package br.ufscar.dc.mvp

class HQ extends Produto{

  static constraints = {
        nome(blank: false, size: 1..30)
        preco(blank: false, min: 0.1f)
        quantidade(blank: false, min: 0)
        editora(nullbale: false)
    }
    
    Editora editora
    
    String toString(){
        return nome
    }
}
