<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-artist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="show-artist" class="content scaffold-show" role="main">
            <h1><g:message code="${artist.name}" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <img class="artistImage" src="${artist.profilePicPath}" height=200/>
            
            <g:if test="${session.Artist}">
            <g:form class="eventButtons" resource="${this.artist}" method="DELETE">
                <fieldset>
                    <g:link class="btn btn-default" action="edit" resource="${this.artist}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
            </g:if>
            
             <ol class="property-list artist">
    
        <li class="fieldcontain">
            <span id="email-label" class="property-label">Email</span>
            <div class="property-value" aria-labelledby="email-label">${artist.email}</div>
        </li>

        <li class="fieldcontain">
            <span id="location-label" class="property-label">Location</span>
            <div class="property-value" aria-labelledby="location-label">${artist.location}</div>
        </li>

         <g:if test="${artist.latitude != '?'}">
             <li class="fieldcontain hide">
                 <div class="property-value" aria-labelledby="latitude-label">${artist.latitude}</div>
             </li>
         </g:if>

         <g:if test="${artist.longitude != '?'}">
             <li class="fieldcontain hide">
                 <div class="property-value" aria-labelledby="longitude-label">${artist.longitude}</div>
             </li>
         </g:if>



                 <li class="fieldcontain">
            <span id="name-label" class="property-label">Name</span>
            <div class="property-value" aria-labelledby="name-label">${artist.name}</div>
        </li>
    
        <li class="fieldcontain">
            <span id="phoneNumber-label" class="property-label">Phone Number</span>
            <div class="property-value" aria-labelledby="phoneNumber-label">${artist.phoneNumber}</div>
        </li>
         <g:if test="${artist.lastFm != '?'}">
             <li class="fieldcontain">
            <span id="lastFm-label" class="property-label">Last FM</span>
            <div class="property-value" aria-labelledby="lastFm-label">${artist.lastFm}</div>
        </li>
        </g:if>

        <g:if test="${artist.spotify != '?'}">
        <li class="fieldcontain">
            <span id="spotify-label" class="property-label">Spotify</span>
            <div class="property-value" aria-labelledby="spotify-label">${artist.spotify}</div>
        </li>
        </g:if>
        <g:if test="${artist.twitter != '?'}">
        <li class="fieldcontain">
            <span id="twitter-label" class="property-label">Twitter</span>
            <div class="property-value" aria-labelledby="twitter-label">${artist.twitter}</div>
        </li>
        </g:if>
        <g:if test="${artist.official != '?'}">
        <li class="fieldcontain">
            <span id="official-label" class="property-label">Official Site</span>
            <div class="property-value" aria-labelledby="official-label">${artist.official}</div>
        </li>
        </g:if>
        <g:if test="${artist.bio != '?'}">
         <li class="fieldcontain">
            <span id="bio-label" class="property-label">Bio</span>
            <div class="property-value" aria-labelledby="bio-label">${artist.bio}</div>
        </li>
        </g:if>
</ol>

         <div id="map" class="venueContainer" data-map_width="600" data-map_height="250"></div>
            

        </div>
        <g:if test="${session.Venue}">
        <h2>Their Upcoming Events</h2>
        </g:if>
        <g:if test="${session.Artist}">
        <h2>Your Upcoming Events</h2>
        </g:if>
            <div class="eventArtistList">
                <ul class="list-unstyled">
                    <g:each in="${confirmedEvents}" var="event">
                        <li>
                            <ul class="list-unstyled">
                                <li class="eventTitle">
                                    <a href="/event/show/${event.id}">${event.title}</a>,
                                </li>
                                <li class="eventLocation">
                                    <g:findAll in="${venueList}" expr="it.name == event.venue">
                                        <a href="/venue/show/${it.id}">${event.venue}</a>
                                    </g:findAll>
                                    - ${event.location}
                                </li>
                                <li class="eventDate">
                                    <g:formatDate date="${event.start_time}" type="both" style="SHORT"/> - <g:formatDate date="${event.end_time}" type="both" style="SHORT"/>
                                </li>
                            </ul>
                        </li>
                    </g:each>
                </ul>
            </div>
            
        <g:if test="${session.Venue}">
            <h2>Events They Have Applied For</h2>
        </g:if>
        <g:if test="${session.Artist}">
            <h2>Events You Have Applied For</h2>
        </g:if>

            <div class="eventArtistList">
                <ul class="list-unstyled">
                    <g:each in="${appliedEvents}" var="event">
                        <li>
                            <ul class="list-unstyled">
                                <li class="eventTitle">
                                    <a href="/event/show/${event.id}">${event.title}</a>,
                                </li>
                                <li class="eventLocation">
                                    <g:findAll in="${venueList}" expr="it.name == event.venue">
                                        <a href="/venue/show/${it.id}">${event.venue}</a>
                                    </g:findAll>
                                    - ${event.location}
                                </li>
                                <li class="eventDate">
                                    <g:formatDate date="${event.start_time}" type="both" style="SHORT"/> - <g:formatDate date="${event.end_time}" type="both" style="SHORT"/>                                        </li>
                            </ul>
                        </li>
                    </g:each>
                </ul>
            </div>

        <h2>All Nearby Events</h2>                  
                    <div class="eventArtistList">
                        <ul class="list-unstyled">
                            <g:each in="${eventList}" var="event">
                                <li>
                                    <ul class="list-unstyled">
                                        <li class="eventTitle">
                                            <a href="/event/show/${event.id}">${event.title}</a>,
                                        </li>
                                        <li class="eventLocation">
                                             <g:findAll in="${venueList}" expr="it.name == event.venue">
                                                  <a href="/venue/show/${it.id}">${event.venue}</a>
                                             </g:findAll>
                                             - ${event.location}
                                        </li>
                                        <li class="eventDate">
                                            <g:formatDate date="${event.start_time}" type="both" style="SHORT"/> - <g:formatDate date="${event.end_time}" type="both" style="SHORT"/>                                        </li>
                                    </ul>
                                </li>
                            </g:each>
                        </ul>
                    </div>


    <div id="proxmap" data-map_width="600" data-map_height="400"></div>
    </body>
</html>
