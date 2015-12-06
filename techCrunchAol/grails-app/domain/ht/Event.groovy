package ht

class Event {

    String title;
    String location;
    String longitude;
    String latitude;
    static hasMany = [appliedArtists: Artist, confirmedArtists: Artist]
    String venue;
    Date start_time;
    Date end_time;


    static constraints = {
    }
}
