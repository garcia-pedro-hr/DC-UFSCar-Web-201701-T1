package br.ufscar.dc.mvp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured

@Transactional(readOnly = true)
@Secured('ROLE_ADMIN')
class DVDController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DVD.list(params), model:[DVDInstanceCount: DVD.count()]
    }

    def show(DVD DVDInstance) {
        respond DVDInstance
    }

    def create() {
        respond new DVD(params)
    }

    @Transactional
    def save(DVD DVDInstance) {
        if (DVDInstance == null) {
            notFound()
            return
        }

        if (DVDInstance.hasErrors()) {
            respond DVDInstance.errors, view:'create'
            return
        }

        DVDInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'DVD.label', default: 'DVD'), DVDInstance.id])
                redirect DVDInstance
            }
            '*' { respond DVDInstance, [status: CREATED] }
        }
    }

    def edit(DVD DVDInstance) {
        respond DVDInstance
    }

    @Transactional
    def update(DVD DVDInstance) {
        if (DVDInstance == null) {
            notFound()
            return
        }

        if (DVDInstance.hasErrors()) {
            respond DVDInstance.errors, view:'edit'
            return
        }

        DVDInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DVD.label', default: 'DVD'), DVDInstance.id])
                redirect DVDInstance
            }
            '*'{ respond DVDInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DVD DVDInstance) {

        if (DVDInstance == null) {
            notFound()
            return
        }

        DVDInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DVD.label', default: 'DVD'), DVDInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'DVD.label', default: 'DVD'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
