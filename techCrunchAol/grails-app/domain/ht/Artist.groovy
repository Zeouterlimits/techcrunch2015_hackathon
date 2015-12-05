package ht

class Artist {

    String id;
    String username;
    String password;
    String name;
    String profilePicPath;
    String phoneNumber;
    String email;

    // Map API object?
    String location;

    static hasMany = [favouriteArtists: Artist, favouriteGenre: Genre];


    String toString() { "$email" }

    static constraints =
            {
                email(phoneNumber:true)
                password(blank:false, password:true)
            }
}
