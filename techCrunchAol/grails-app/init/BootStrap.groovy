import ht.*;

class BootStrap {

    def init = {  servletContext ->
        new Fan(email:"eg@eg.com",password:"password").save()
    }
    def destroy = {
    }
}
