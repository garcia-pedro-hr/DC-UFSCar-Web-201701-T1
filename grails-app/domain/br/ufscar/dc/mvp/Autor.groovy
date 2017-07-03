package br.ufscar.dc.mvp

class Autor {
    
    static hasMany = [livros: Livro]
    
    static constraints = {
        nome(blank: false, size: 1..40)
    }
    
    String nome
    
    String toString(){
        return nome
    }
}
