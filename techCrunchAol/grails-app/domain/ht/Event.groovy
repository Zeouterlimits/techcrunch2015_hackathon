package ht

class Event {

     String title;
     String location;
     static hasMany = [appliedArtists: Artist]
     static hasMany = [confirmedArtists: Artist]
     String venue;
     Date start_time;
     Date end_time;


    static constraints = {
    }
}
