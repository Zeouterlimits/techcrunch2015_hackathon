package ht

class Artist {

    String id;
    String username;
    String password;
    String name;
    String profilePicPath;
    String phoneNumber;
    String email;
    String lastFm;
    String spotify;
    String twitter;
    String official;
    String bio;
    String latitude;
    String longitude;


    // Map API object?
    String location;

    static hasMany = [favouriteArtists: Artist, favouriteGenre: Genre];


    String toString() {name }

    static constraints =
            {
                email(phoneNumber:true)
                password(blank:false, password:true)
            }
}
