import ht.*;

class BootStrap {

    def init = {  servletContext ->
        new Event(title:"Brazen Battle of the Bands",venue:"Brazen Head",location:"Dublin",start_time: '2015-12-05 00:00:00 GMT', end_time: '2015-12-05 00:00:00 GMT').save()
        new Event(title:"Chiptune night featuring CHIPZEL",venue:"Brazen Head",location:"Dublin",start_time: '2015-12-05 00:00:00 GMT', end_time: '2015-12-05 00:00:00 GMT').save()

        new Artist(username:"test",name:"U2",profilePicPath:"C:/wtf.png",phoneNumber:"353860567862",location:"Dublin",email:"u2@cayman.com",password:"password").save()
        new Artist(username:"nickeback",name:"Not Nickleback",profilePicPath:"C:/wtf.png",phoneNumber:"353860567862",location:"Dublin",email:"nickleback@cayman.com",password:"password").save()

        new Venue(username:"brazenHeadManager",name:"Brazen Head",profilePicPath:"C:/wtf.png",phoneNumber:"353860567862",location:"Dublin",email:"brazenHead@cayman.com",password:"password").save()
        new Venue(username:"arthursManager",name:"Arthurs",profilePicPath:"C:/wtf.png",phoneNumber:"353860567862",location:"Dublin",email:"arthurs@cayman.com",password:"password").save()



    }
    def destroy = {
    }
}
