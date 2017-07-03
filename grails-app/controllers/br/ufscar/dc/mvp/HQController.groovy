package br.ufscar.dc.mvp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HQController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond HQ.list(params), model:[HQInstanceCount: HQ.count()]
    }

    def show(HQ HQInstance) {
        respond HQInstance
    }

    def create() {
        respond new HQ(params)
    }

    @Transactional
    def save(HQ HQInstance) {
        if (HQInstance == null) {
            notFound()
            return
        }

        if (HQInstance.hasErrors()) {
            respond HQInstance.errors, view:'create'
            return
        }

        HQInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'HQ.label', default: 'HQ'), HQInstance.id])
                redirect HQInstance
            }
            '*' { respond HQInstance, [status: CREATED] }
        }
    }

    def edit(HQ HQInstance) {
        respond HQInstance
    }

    @Transactional
    def update(HQ HQInstance) {
        if (HQInstance == null) {
            notFound()
            return
        }

        if (HQInstance.hasErrors()) {
            respond HQInstance.errors, view:'edit'
            return
        }

        HQInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'HQ.label', default: 'HQ'), HQInstance.id])
                redirect HQInstance
            }
            '*'{ respond HQInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(HQ HQInstance) {

        if (HQInstance == null) {
            notFound()
            return
        }

        HQInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'HQ.label', default: 'HQ'), HQInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'HQ.label', default: 'HQ'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
