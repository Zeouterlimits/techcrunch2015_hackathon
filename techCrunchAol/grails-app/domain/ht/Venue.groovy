package ht

class Venue {

    String username;
    String password;
    String name;
    String profilePicPath;
    String phoneNumber;
    String email;

    // Map API object?
    String location;

    static hasMany = [favouriteArtists: Artist, favouriteGenre: Genre];


    static constraints = {
    }
}