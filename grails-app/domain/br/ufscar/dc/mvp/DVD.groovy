package br.ufscar.dc.mvp

class DVD extends Produto {

    static constraints = {
        nome(blank: false, size: 1..30)
        preco(blank: false, min: 0.1f)
        quantidade(blank: false, min: 0)
        ano(blank: false, min: 1900)
        diretor(nullable: false)
    }
    
    int ano
    Diretor diretor
    
    String toString(){
        return nome + " - " + diretor.nome
    }

}
