package ht

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VenueController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Venue.list(params), model:[venueCount: Venue.count()]
    }

    def show(Venue venue) {
        respond venue
    }

    def create() {
        respond new Venue(params)
    }

    @Transactional
    def save(Venue venue) {
        if (venue == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (venue.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond venue.errors, view:'create'
            return
        }

        venue.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'venue.label', default: 'Venue'), venue.id])
                redirect venue
            }
            '*' { respond venue, [status: CREATED] }
        }
    }

    def edit(Venue venue) {
        respond venue
    }

    @Transactional
    def update(Venue venue) {
        if (venue == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (venue.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond venue.errors, view:'edit'
            return
        }

        venue.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'venue.label', default: 'Venue'), venue.id])
                redirect venue
            }
            '*'{ respond venue, [status: OK] }
        }
    }

    @Transactional
    def delete(Venue venue) {

        if (venue == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        venue.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'venue.label', default: 'Venue'), venue.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'venue.label', default: 'Venue'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
