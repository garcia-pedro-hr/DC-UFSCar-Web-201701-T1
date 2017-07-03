package br.ufscar.dc.mvp

class Artista {

    //static hasMany = [cds: CD]
    
    static constraints = {
        name(blank: false, size: 1..40)
    }
    
    String name
    
    String toString(){
        return name
    }
}