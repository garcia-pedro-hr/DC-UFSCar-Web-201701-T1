package br.ufscar.dc.mvp

class Diretor {

    static hasMany = [filmes: DVD]
    
    static constraints = {
        nome(blank: false, size: 1..40)
    }
    
    String nome
    
    String toString(){
        return nome
    }
    
}
