package ht

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FanController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Fan.list(params), model:[fanCount: Fan.count()]
    }

    def show(Fan fan) {
        respond fan
    }

    def create() {
        respond new Fan(params)
    }

    @Transactional
    def save(Fan fan) {
        if (fan == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (fan.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond fan.errors, view:'create'
            return
        }

        fan.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'fan.label', default: 'Fan'), fan.id])
                redirect fan
            }
            '*' { respond fan, [status: CREATED] }
        }
    }

    def edit(Fan fan) {
        respond fan
    }

    @Transactional
    def update(Fan fan) {
        if (fan == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (fan.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond fan.errors, view:'edit'
            return
        }

        fan.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'fan.label', default: 'Fan'), fan.id])
                redirect fan
            }
            '*'{ respond fan, [status: OK] }
        }
    }

    @Transactional
    def delete(Fan fan) {

        if (fan == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        fan.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'fan.label', default: 'Fan'), fan.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'fan.label', default: 'Fan'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
