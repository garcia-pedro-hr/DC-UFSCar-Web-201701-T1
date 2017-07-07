package br.ufscar.dc.mvp


import org.springframework.security.access.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('ROLE_ADMIN')
class CDController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CD.list(params), model:[CDInstanceCount: CD.count()]
    }

    def show(CD CDInstance) {
        respond CDInstance
    }

    def create() {
        respond new CD(params)
    }

    @Transactional
    def save(CD CDInstance) {
        
        if (CDInstance == null) {
            notFound()
            return
        }

        if (CDInstance.hasErrors()) {
            respond CDInstance.errors, view:'create'
            return
        }

        CDInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'CD.label', default: 'CD'), CDInstance.id])
                redirect CDInstance
            }
            '*' { respond CDInstance, [status: CREATED] }
        }
    }

    def edit(CD CDInstance) {
        respond CDInstance
    }

    @Transactional
    def update(CD CDInstance) {
        if (CDInstance == null) {
            notFound()
            return
        }

        if (CDInstance.hasErrors()) {
            respond CDInstance.errors, view:'edit'
            return
        }

        CDInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CD.label', default: 'CD'), CDInstance.id])
                redirect CDInstance
            }
            '*'{ respond CDInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CD CDInstance) {

        if (CDInstance == null) {
            notFound()
            return
        }

        CDInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CD.label', default: 'CD'), CDInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'CD.label', default: 'CD'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
