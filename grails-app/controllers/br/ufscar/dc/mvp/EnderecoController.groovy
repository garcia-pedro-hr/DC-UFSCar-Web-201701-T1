package br.ufscar.dc.mvp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured

@Transactional(readOnly = true)
@Secured('ROLE_ADMIN')
class EnderecoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Endereco.list(params), model:[enderecoInstanceCount: Endereco.count()]
    }

    def show(Endereco enderecoInstance) {
        respond enderecoInstance
    }

    def create() {
        respond new Endereco(params)
    }

    @Transactional
    def save(Endereco enderecoInstance) {
        if (enderecoInstance == null) {
            notFound()
            return
        }

        if (enderecoInstance.hasErrors()) {
            respond enderecoInstance.errors, view:'create'
            return
        }

        enderecoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'endereco.label', default: 'Endereco'), enderecoInstance.id])
                redirect enderecoInstance
            }
            '*' { respond enderecoInstance, [status: CREATED] }
        }
    }

    def edit(Endereco enderecoInstance) {
        respond enderecoInstance
    }

    @Transactional
    def update(Endereco enderecoInstance) {
        if (enderecoInstance == null) {
            notFound()
            return
        }

        if (enderecoInstance.hasErrors()) {
            respond enderecoInstance.errors, view:'edit'
            return
        }

        enderecoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Endereco.label', default: 'Endereco'), enderecoInstance.id])
                redirect enderecoInstance
            }
            '*'{ respond enderecoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Endereco enderecoInstance) {

        if (enderecoInstance == null) {
            notFound()
            return
        }

        enderecoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Endereco.label', default: 'Endereco'), enderecoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'endereco.label', default: 'Endereco'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
