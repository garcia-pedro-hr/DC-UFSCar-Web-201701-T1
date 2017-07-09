package br.ufscar.dc.mvp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import groovy.json.*
import java.io.File
import grails.converters.JSON
import org.springframework.security.access.annotation.Secured

@Transactional(readOnly = true)
@Secured('ROLE_ADMIN')
class ProdutoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Produto.list(params), model:[produtoInstanceCount: Produto.count()]
     //render(view:"buscaDisponibilidade")
    }

    def show(Produto produtoInstance) {
        respond produtoInstance
    }

    def create() {
        respond new Produto(params)
    }

    @Transactional
    def save(Produto produtoInstance) {
        if (produtoInstance == null) {
            notFound()
            return
        }

        if (produtoInstance.hasErrors()) {
            respond produtoInstance.errors, view:'create'
            return
        }

        produtoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'produto.label', default: 'Produto'), produtoInstance.id])
                redirect produtoInstance
            }
            '*' { respond produtoInstance, [status: CREATED] }
        }
    }

    def edit(Produto produtoInstance) {
        respond produtoInstance
    }

    @Transactional
    def update(Produto produtoInstance) {
        if (produtoInstance == null) {
            notFound()
            return
        }

        if (produtoInstance.hasErrors()) {
            respond produtoInstance.errors, view:'edit'
            return
        }

        produtoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Produto.label', default: 'Produto'), produtoInstance.id])
                redirect produtoInstance
            }
            '*'{ respond produtoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Produto produtoInstance) {

        if (produtoInstance == null) {
            notFound()
            return
        }

        produtoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Produto.label', default: 'Produto'), produtoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'produto.label', default: 'Produto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def getQuantidade () {
        render Produto.findById(params.id).quantidade
    }
    
    def adicionaProduto() {       
        def path = grailsApplication.mainContext.servletContext.getRealPath('files/produtos.json')
        def file = new File(path)
        def produtoList = []
        
        if (!file.exists()) {
            System.out.println("CREATING JSON FILE ENDED WITH SUCCESS : " + new File(path).createNewFile())
            file = new File(path)
            produtoList = []
        } else {
            System.out.println("FILE EXISTS, CALLING JSON SLURPER")
            def slurper = new JsonSlurper()
            produtoList = slurper.parseText(file.getText("UTF-8"))
        }
        
        System.out.println(produtoList)
        produtoList.add(params.nomeProduto)
        def produtoListJson = JsonOutput.toJson(produtoList)
        System.out.println(produtoListJson)
        //file.write(produtoListJson)
        file.withWriter("UTF-8"){
            it.writeLine produtoListJson
        }
        System.out.println(file.getText("UTF-8"))
               
        render "ok"
      
    }
    
    def listaProduto()
    {
        def path = grailsApplication.mainContext.servletContext.getRealPath('files/produtos.json')
        def file = new File(path)
        def produtoList = []
        
        if (file.exists()) {
             System.out.println("FILE EXISTS, CALLING JSON SLURPER")
            def slurper = new JsonSlurper()
            produtoList = slurper.parseText(file.getText("UTF-8"))
        }    
        render produtoList as JSON
    }
    
    def getProduto()
    {
        def nome = params.nomeProduto
        def produto = Produto.findByNome(nome)
        def prod = [:]
        def prod2 = ["nome":produto.nome, "quantidade":produto.quantidade, "preco":produto.preco, "tipo":  produto.getClass().getSimpleName()]
        render prod2 as JSON
    }
}
