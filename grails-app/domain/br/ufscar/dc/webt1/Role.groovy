package br.ufscar.dc.webt1

class Role {

    String authority

    static mapping = {
        cache false
        datasource 'remar'
    }

    static constraints = {
        authority blank: false, unique: true
    }
}
