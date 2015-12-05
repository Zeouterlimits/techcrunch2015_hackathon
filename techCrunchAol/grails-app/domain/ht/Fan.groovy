package ht

class Fan {

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
                email(email:true)
                password(blank:false, password:true)
            }
}
