package security

import org.springframework.security.core.context.SecurityContextHolder

class SecurityTagLib {

    //def springSecurityService

    static namespace = "security"

    def name = { attrs ->
        out << SecurityContextHolder.context.authentication?.name
    }

    def ifLoggedIn = {attrs, body ->
        println('ifLoggedIn ' + SecurityContextHolder.context.authentication?.isAuthenticated());
        if(SecurityContextHolder.context.authentication?.isAuthenticated()) {
            out << body()
        }
    }

    def ifNotLoggedIn = {attrs, body ->
        println('ifNotLoggedIn ' +SecurityContextHolder.context.authentication?.isAuthenticated());
        if(!SecurityContextHolder.context.authentication?.isAuthenticated()) {
            out << body()
        }
    }



//    SecurityTagLib() {
//        System.out.println(SecurityContextHolder.context());
//    }
}