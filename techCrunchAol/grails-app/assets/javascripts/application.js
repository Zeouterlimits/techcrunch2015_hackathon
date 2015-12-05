// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.1.3.js
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $('#spinner').ajaxStart(function() {
            $(this).fadeIn();
        }).ajaxStop(function() {
            $(this).fadeOut();
        });
    })(jQuery);
}


    function MapQuest(){

        var self = this;

        self.popup = L.popup();
        self.x = $("#demo");
        self.key = "rfcYFGTiHFcPCCc3nORTNEDnHuBpte9n";
        self.searchBaseUrl = "http://www.mapquestapi.com/geocoding/v1/address?key=" + self.key;
        self.mapContainer = $("#map");
        self.map = null;


        self.getGeoSuccess = function(position){

            self.showPosition(position);
            self.initMap(position);
        }

        self.getGeoFailure = function(){
            alert("failed to get geolocation");
        }

        self.getGeoLocation = function(position){
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(self.getGeoSuccess,self.getGeoFailure);
            } else {
                self.x.text("Geolocation is not supported by this browser.");
            }

        }

        self.showPosition = function(position){
            self.x.text("Latitude: " + position.coords.latitude +
            "<br>Longitude: " + position.coords.longitude);
        }

        self.initMarker = function(position){
            var LeafIcon = L.Icon.extend({
                options: {
                    iconSize:     [40, 40]
                }
            });

            var greenIcon = new LeafIcon({iconUrl: '/assets/guitar-icon.png'});
            self.marker = L.marker([position.coords.latitude, position.coords.longitude], {icon: greenIcon, draggable:true}).addTo(self.map);

            self.marker.on('dragend', function(){
                alert(self.marker.target._latlng);
            })

            self.marker.addTo(self.map);

        }

        self.initCircle = function(){

            var circle = L.circle([51.508, -0.11], 500, {
                color: 'red',
                fillColor: '#f03',
                fillOpacity: 0.5
            }).addTo(map);
        }


        self.initMap = function(position){

            self.map = L.map('map', {
                layers: MQ.mapLayer(),
                center: [ position.coords.latitude, position.coords.longitude ],
                zoom: 12
            });


            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
                attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
                maxZoom: 18,
                id: 'your.mapbox.project.id',
                accessToken: 'rfcYFGTiHFcPCCc3nORTNEDnHuBpte9n'
            }).addTo(map);

            map.on('click', self.onMapClick);

            self.initMarker(position);

            self.printCoords(position.coords);

        }

        self.onMapClick = function(e) {
            self.popup.setLatLng(e.latlng)
                .setContent("You clicked the map at " + e.latlng.toString())
                .openOn(map);
        }

        self.mapClickPopup = function(e){
            self.popup.setLatLng(e.latlng)
                .setContent("You clicked the map at " + e.latlng.toString())
                .openOn(map);
        }


        self.updateMap = function(coords){

            self.map.panTo(new L.LatLng(coords.lat, coords.lng));
            self.marker.setLatLng(coords);
            self.printCoords(coords);

        }

        self.printCoords = function(coords){
            if(coords.lat == undefined){
                $("#demo").text("Lat = " + coords.latitude + " & Long = " + coords.longitude );
            }else{
                $("#demo").text("Lat = " + coords.lat + " & Long = " + coords.lng );
            }
        }




        self.search = function(){

            url = self.searchBaseUrl + "&location=" + $("#address").val();


            $.get(url, function (data) {
                if (data !== "") {
                    data = JSON.parse(data);
                    coords = data.results[0].locations[0].latLng;
                    console.log( "lat = " + coords.lat + " and longitude = " + coords.lng );

                    if(self.map == null){
                        position = {coords : {latitute: coords.lat, longitute : coords.lng}}
                        console.dir(position);
                        self.initMap(position)
                    }
                    self.updateMap(coords);
                } else {
                    alert("empty data")
                }
            }, 'html').fail(function (jqXHR, textStatus, errorThrown) {
                console.log("Season Load Ajax failed: " + textStatus + ", " + errorThrown.toString());
            }).always(function(){
                // always remove loading etc
            });

        }



        $(document).ready(function(){

            $("#get_location").click(function(){
                self.getGeoLocation();
            });

            $("#search_address").click(self.search);

        });
    }


    var mapquest = MapQuest();



