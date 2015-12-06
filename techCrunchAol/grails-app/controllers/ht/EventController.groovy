package ht

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.*


@Transactional(readOnly = true)
class EventController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", apply: "PUT", approve: "PUT",remove: "PUT"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Event.list(params), model:[eventCount: Event.count()]
    }

    def show(Event event) {
        respond event
    }

    def create() {
        respond new Event(params)
    }


    def listAll() {
        render Event.list() as JSON
    }

    @Transactional
    def save(Event event) {
        if (event == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (event.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond event.errors, view:'create'
            return
        }

        event.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), event.id])
                redirect event
            }
            '*' { respond event, [status: CREATED] }
        }
    }

    def edit(Event event) {
        respond event
    }

    @Transactional
    def update(Event event) {
        if (event == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (event.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond event.errors, view:'edit'
            return
        }

        event.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'event.label', default: 'Event'), event.id])
                redirect event
            }
            '*'{ respond event, [status: OK] }
        }
    }

    @Transactional
    def delete(Event event) {

        if (event == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        event.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'event.label', default: 'Event'), event.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    @Transactional
    def apply(Event event) {
        if (event == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (event.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond event.errors, view:'edit'
            return
        }
        //hardcoded artist ID , replace 1 with current Artist's ID from session
        Artist artist = Artist.get(1);
        
        event.appliedArtists.add(artist)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'event.label', default: 'Event'), event.id])
                redirect event
            }
            '*'{ respond event, [status: OK] }
        }
    }

    @Transactional
    def approve(Event event, String artistID) {
        if (event == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (event.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond event.errors, view:'edit'
            return
        }
        def artist = Artist.get(params.int('artistID'));
        
        event.appliedArtists.remove(artist)
        
        event.confirmedArtists.add(artist)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'event.label', default: 'Event'), event.id])
                redirect event
            }
            '*'{ respond event, [status: OK] }
        }
    }

    @Transactional
    def remove(Event event, String artistID) {
        if (event == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (event.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond event.errors, view:'edit'
            return
        }
        
        def artist = Artist.get(params.int('artistID'));
        
        event.confirmedArtists.remove(artist)
      

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'event.label', default: 'Event'), event.id])
                redirect event
            }
            '*'{ respond event, [status: OK] }
        }
    }
    
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
