import ht.Artist
import ht.Event
import ht.Venue

class BootStrap {

    def init = { servletContext ->

        def a1 = new Artist(username: "test", name: "U2", profilePicPath: "/assets/u2_artist_picture.jpg", phoneNumber: "353860567862", location: "Dublin", email: "u2@cayman.com", password: "password", lastFm: "?", spotify: "?", twitter: "?",official: "?", bio: "?").save(failOnError: true)
        def a2 = new Artist(username: "nickeback", name: "Not Nickleback", profilePicPath: "/assets/u2_artist_picture.jpg", phoneNumber: "353860567862", location: "Dublin", email: "nickleback@cayman.com", password: "password" ,lastFm: "?", spotify: "?", twitter: "?",official: "?", bio: "?").save(failOnError: true)

        def v1 = new Venue(username: "brazenHeadManager", name: "Brazen Head", latitude: "51.5443601", longitude: "-0.0201986", profilePicPath: "C:/wtf.png", phoneNumber: "353860567862", location: "Dublin", email: "brazenHead@cayman.com", password: "password").save(failOnError: true)
        def v2 = new Venue(username: "arthursManager", name: "Arthurs", latitude: "51.5443601", longitude: "-0.0201986", profilePicPath: "C:/wtf.png", phoneNumber: "353860567862", location: "Dublin", email: "arthurs@cayman.com", password: "password").save(failOnError: true)

        def now = Calendar.instance.time
        new Event(title: "Brazen Battle of the Bands", venue: "Brazen Head",
                location: "Dublin",
                start_time: now + 1,//+24hrs
                end_time: now + 2,
                confirmedArtists: [a2, a1]

        ).save(failOnError: true)


    }
    def destroy = {
    }
}
