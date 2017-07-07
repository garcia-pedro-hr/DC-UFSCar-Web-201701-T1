
import br.ufscar.dc.mvp.User
import br.ufscar.dc.mvp.Artista
import br.ufscar.dc.mvp.Autor
import br.ufscar.dc.mvp.CD
import br.ufscar.dc.mvp.DVD
import br.ufscar.dc.mvp.Diretor
import br.ufscar.dc.mvp.Editora
import br.ufscar.dc.mvp.Endereco
import br.ufscar.dc.mvp.HQ
import br.ufscar.dc.mvp.Livro
import br.ufscar.dc.mvp.Role
import br.ufscar.dc.mvp.UserRole

class BootStrap {

    def init = { servletContext ->

        if (!Role.list()) {
            new Role(authority: "ROLE_ADMIN").save flush: true  /* Administrador */
            new Role(authority: "ROLE_SLSMN").save flush: true  /* Vendedor */

            log.debug "Roles: DONE"
        }

        if (!User.list()) {
            def admin = new User (
                    username: "admin",
                    password: "root",
                    email: "admin@mvp.br",
                    firstName: "Administrador",
                    lastName: " MVP",
                    enabled: true
            )
            admin.save flush: true
            
            def slsmn = new User(
                username: "slsmn",
                password: "root",
                email: "slsmn@mvp.br",
                firstName: "Vendedor",
                lastName: "MVP",
                enabled: true
            )
            slsmn.save flush: true
            
            UserRole.create admin, Role.findByAuthority("ROLE_ADMIN"), true
            UserRole.create admin, Role.findByAuthority("ROLE_SLSMN"), true
            
            UserRole.create slsmn, Role.findByAuthority("ROLE_SLSMN"), true

            log.debug "Users: DONE"
        }
        
        def artista1 = new Artista(nome: "The Beatles")
        def artista2 = new Artista(nome: "Pink Floyd")
        def artista3 = new Artista(nome: "Mamonas Assassinas")
        artista1.save flush: true
        artista2.save flush: true
        artista3.save flush: true

        
        def cd1 = new CD(nome: "Revolver", preco: 29.99, quantidade: 5, ano: 1965, artista: artista1)
        def cd2 = new CD(nome: "The Dark Side of the Moon", preco: 33.55, quantidade: 12, ano: 1974, artista: artista2)
        def cd3 = new CD(nome: "Mamonas Assassinas", preco: 10, quantidade: 1, ano: 1996, artista: artista3)
        def cd4 = new CD(nome: "The White Album", preco: 50.95, quantidade: 3, ano: 1968, artista: artista1)
        cd1.save flush: true
        cd2.save flush: true
        cd3.save flush: true
        cd4.save flush: true
        
        def diretor1 = new Diretor(nome: "Steven Spielberg")
        def diretor2 = new Diretor(nome: "Christopher Nolan")
        diretor1.save flush: true
        diretor2.save flush: true
        
        def dvd1 = new DVD(nome: "Interestelar", preco: 25.99, quantidade: 20, ano: 2014, diretor: diretor2)
        def dvd2 = new DVD(nome: "Jurassic Park", preco: 5.95, quantidade: 3, ano: 1993, diretor: diretor1)
        dvd1.save flush: true
        dvd2.save flush: true
        
        def end1 = new Endereco(CEP: "14110-000", logradouro: "Estrada da Limeirinha", numero: 800, complemento: "casa 919",
            bairro: "Bonfim Paulista", cidade: "Ribeirão Preto")
        def end2 = new Endereco(CEP: "13556-520", logradouro: "Alameda das Orquideas", numero: 800, complemento: "",
            bairro: "Cidade Jardim", cidade: "São Carlos")
        end1.save flush: true
        end2.save flush: true
        
        def ed1 = new Editora(nome: "Fundamento", CNPJ: "332180009/0001-43", endereco: end1)
        def ed2 = new Editora(nome: "Arqueiro", CNPJ: "123456789/1234-12", endereco: end2)
        ed1.save flush: true
        ed2.save flush: true
        
        def autor1 = new Autor(nome: "Harlan Coben")
        def autor2 = new Autor(nome: "Jo Nesbø")
        autor1.save flush: true
        autor2.save flush: true
        
        def livro1 = new Livro(nome: "Boneco de Neve", preco: 49.99, quantidade: 30, autor: autor2, 
            editora: ed1, classificacao: "Suspense")
        def livro2 = new Livro(nome: "Quebra de Confiança", preco: 32.95, quantidade: 4, autor: autor1,
            editora: ed2, classificacao: "Policial")
        livro1.save flush: true
        livro2.save flush: true
        
        def hq1 = new HQ(nome: "Tio Patinhas", preco: 3.27, quantidade: 40, editora: ed1)
        def hq2 = new HQ(nome: "Naruto", preco: 5.90, quantidade: 22, editora: ed2)
        def hq3 = new HQ(nome: "Popeye", preco: 1.00, quantidade: 56, editora: ed1)
        hq1.save flsuh: true
        hq2.save flush: true
        hq3.save flush: true
        
        log.debug "Bootstrap: DONE"

    }

    def destroy = {
    }
}
