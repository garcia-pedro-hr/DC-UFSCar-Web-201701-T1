package br.ufscar.dc.mvp

class Editora {

    static constraints = {
        nome(blank: false)
        CNPJ (blank: false, unique: true, size: 17..17, matches: '\\d{9}\\/\\d{4}\\-\\d{2}')
        endereco(nullable: false)
    }
    
    String nome
    String CNPJ
    Endereco endereco
    
    String toString(){
        return nome
    }
}
