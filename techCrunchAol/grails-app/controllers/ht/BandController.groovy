package ht

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BandController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Band.list(params), model:[bandCount: Band.count()]
    }

    def show(Band band) {
        respond band
    }

    def create() {
        respond new Band(params)
    }

    @Transactional
    def save(Band band) {
        if (band == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (band.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond band.errors, view:'create'
            return
        }

        band.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'band.label', default: 'Band'), band.id])
                redirect band
            }
            '*' { respond band, [status: CREATED] }
        }
    }

    def edit(Band band) {
        respond band
    }

    @Transactional
    def update(Band band) {
        if (band == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (band.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond band.errors, view:'edit'
            return
        }

        band.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'band.label', default: 'Band'), band.id])
                redirect band
            }
            '*'{ respond band, [status: OK] }
        }
    }

    @Transactional
    def delete(Band band) {

        if (band == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        band.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'band.label', default: 'Band'), band.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'band.label', default: 'Band'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
