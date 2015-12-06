import ht.Artist
import ht.Event
import ht.Venue

class BootStrap {

    def init = { servletContext ->

        def a1 = new Artist(username: "test", name: "U2", profilePicPath: "/assets/u2_artist_picture.jpg", phoneNumber: "353860567862", location: "Dublin",latitude: "53.34653", longitude: "-6.25606", email: "u2@cayman.com", password: "password", lastFm: "?", spotify: "?", twitter: "?",official: "?", bio: "?").save()
        def a2 = new Artist(username: "nickeback", name: "Not Nickleback", profilePicPath: "/assets/nickleback_artist_picture.jpg", phoneNumber: "353860567862", location: "Dublin", latitude: "51.5443601", longitude: "-0.0201986", email: "nickleback@cayman.com", password: "password" ,lastFm: "?", spotify: "?", twitter: "?",official: "?", bio: "?").save()

        def v1 = new Venue(username: "brazenHeadManager", name: "Brazen Head", latitude: "51.5443601", longitude: "-0.0201986", profilePicPath: "/assets/the-brazen-head-medium.jpg", phoneNumber: "353860567862", location: "Queen Elizabeth Olympic Park, London", email: "brazenHead@cayman.com", password: "password").save()
        def v2 = new Venue(username: "arthursManager", name: "Arthurs", latitude: "51.5443601", longitude: "-0.0201986", profilePicPath: "/assets/arthurs.jpg", phoneNumber: "353860567862", location: "Dublin", email: "arthurs@cayman.com", password: "password").save()

        def now = Calendar.instance.time
        new Event(title: "Brazen Battle of the Bands", venue: "Brazen Head",
                location: "Queen Elizabeth Olympic Park, London",
                start_time: now + 1,//+24hrs
                end_time: now + 2,
                latitude: "51.54569452517835",
                longitude: "-0.02300262451171875",
                confirmedArtists: [a2, a1]

        ).save(failOnError: true)


    }
    def destroy = {
    }
}
