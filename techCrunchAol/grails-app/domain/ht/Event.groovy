package ht

class Event {

     String title;
     String location;
     static hasMany = [artists: Artist]
     Date start_time;
     Date end_time;


    static constraints = {
    }
}
