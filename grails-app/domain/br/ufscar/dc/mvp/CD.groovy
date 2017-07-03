package br.ufscar.dc.mvp

class CD extends Produto {
static constraints = {
        nome(blank: false, size: 1..30)
        preco(blank: false, min: 0.1f)
        quantidade(blank: false, min: 0)
        ano(blank: false, min: 1900)
        artista(nullable: false)
    }
    
    int ano
    Artista artista
    
    String toString(){
        return nome + " - " + artista.nome
    }
}
