package br.ufscar.dc.mvp

class Artista {

    static hasMany = [cds: CD]
    
    static constraints = {
        nome(blank: false, size: 1..40)
    }
    
    String nome
    
    String toString(){
        return nome
    }
}