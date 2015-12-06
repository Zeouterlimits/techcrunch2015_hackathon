package ht

class Venue {

    String username;
    String password;
    String name;
    String profilePicPath;
    String phoneNumber;
    String email;
    String latitude;
    String longitude;



    // Map API object?
    String location;

    static hasMany = [favouriteArtists: Artist, favouriteGenre: Genre];


    static constraints = {
    }
}
