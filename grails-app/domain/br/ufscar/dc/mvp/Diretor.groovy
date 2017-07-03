package br.ufscar.dc.mvp

class Diretor {

    //static hasMany = [filmes: DVD]
    
    static constraints = {
        name(blank: false, size: 1..40)
    }
    
    String name
    
    String toString(){
        return name
    }
    
}
