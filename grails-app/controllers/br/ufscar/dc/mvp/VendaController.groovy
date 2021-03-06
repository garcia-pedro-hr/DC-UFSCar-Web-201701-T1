package br.ufscar.dc.mvp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_SLSMN'])
class VendaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Venda.list(params), model:[vendaInstanceCount: Venda.count()]
    }

    def show(Venda vendaInstance) {
        respond vendaInstance
    }

    def create() {
        respond new Venda(params)
    }

    @Transactional
    def save(Venda vendaInstance) {
        if (vendaInstance == null) {
            notFound()
            return
        }

        if (vendaInstance.hasErrors()) {
            respond vendaInstance.errors, view:'create'
            return
        }
        
        if(Produto.findById(vendaInstance.produto.id).quantidade <= 0){
            render "O produto não está disponivel no momento :-("
            return
        } else if (vendaInstance.quantidade > Produto.findById(vendaInstance.produto.id).quantidade){
            render "Tentativa de venda incorreta! Tentativa: " + vendaInstance.quantidade + ", mas temos apenas " + Produto.findById(vendaInstance.produto.id).quantidade + " unidades de " + Produto.findById(vendaInstance.produto.id).nome
            return
        }
        else {
            Produto.findById(vendaInstance.produto.id).quantidade -= vendaInstance.quantidade
        }

        vendaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'venda.label', default: 'Venda'), vendaInstance.id])
                redirect vendaInstance
            }
            '*' { respond vendaInstance, [status: CREATED] }
        }
    }

    def edit(Venda vendaInstance) {
        respond vendaInstance
    }

    @Transactional
    def update(Venda vendaInstance) {
        if (vendaInstance == null) {
            notFound()
            return
        }

        if (vendaInstance.hasErrors()) {
            respond vendaInstance.errors, view:'edit'
            return
        }

        vendaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Venda.label', default: 'Venda'), vendaInstance.id])
                redirect vendaInstance
            }
            '*'{ respond vendaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Venda vendaInstance) {

        if (vendaInstance == null) {
            notFound()
            return
        }

        vendaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Venda.label', default: 'Venda'), vendaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    @Transactional
    def saveOne() {
        def vendaInstance = new Venda()
        vendaInstance.funcionario = User.findById(params.user)
        vendaInstance.produto = Produto.findById(params.produto)
        vendaInstance.quantidade = params.quantidade as int

        if (vendaInstance.produto.quantidade <= 0){
            render "INDISPONIVEL"
            return
        } else if (vendaInstance.quantidade > vendaInstance.produto.quantidade){
            render "INVALIDO"
            return
        } else {
            vendaInstance.produto.quantidade -= vendaInstance.quantidade
        }

        vendaInstance.save flush:true

        render "OK"
    }

}
