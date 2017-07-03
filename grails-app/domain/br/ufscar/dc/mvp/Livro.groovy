package br.ufscar.dc.mvp

class Livro extends Produto{

   
    static constraints = {
        nome(blank: false, size: 1..30)
        preco(blank: false, min: 0.1f)
        quantidade(blank: false, min: 0)
        autor(nullable: false)
        editora(nullable: false)
        classificacao(blank: false)
    }
    
    Autor autor
    Editora editora
    String classificacao
    
    String toString(){
        return nome + " - " + autor.nome
    }
}

