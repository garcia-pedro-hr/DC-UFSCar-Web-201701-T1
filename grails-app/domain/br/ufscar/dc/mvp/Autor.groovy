package br.ufscar.dc.mvp

class Autor {
    
    //static hasMany = [livros: Livro]
    
    static constraints = {
        name(blank: false, size: 1..40)
    }
    
    String name
    
    String toString(){
        return name
    }
}
