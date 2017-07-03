package br.ufscar.dc.mvp

class Endereco {

    static constraints = {
        CEP (blank: false, size: 9..9, matches: '\\d{5}\\-\\d{3}')
        logradouro (blank: false, size: 1..40)
        numero (min: 1)
        complemento (nullable: true, size: 1..40)
        bairro (blank: false, size: 1..40)
        cidade (blank: false, size: 1..40)
    }
    
    String CEP
    String logradouro
    String complemento
    int numero
    String bairro
    String cidade
    
    String toString(){
        return logradouro + ", " + numero + (complemento==null ? "" : " " + complemento) + ". " + bairro +
        " " + CEP + " " + cidade
    }
}
