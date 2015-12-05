import ht.*;

class BootStrap {

    def init = {  servletContext ->
        new Artist(username:"test",name:"Liz",profilePicPath:"C:/wtf.png",phoneNumber:"353860567862",location:"Dublin",email:"eg1@eg.com",password:"password").save()
    }
    def destroy = {
    }
}
