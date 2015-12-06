<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'venue.label', default: 'Venue')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-venue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="show-venue" class="content scaffold-show" role="main">
            <h1><g:message code="${venue.name}" args="[entityName]" /></h1>

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <img class="artistImage" src="${venue.profilePicPath}" height=200/>

            <g:if test="${session.Venue}">

                <g:form class="venueButtons" resource="${this.venue}" method="DELETE">
                    <fieldset class="">
                        <g:link class="btn btn-default" action="edit" resource="${this.venue}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

                    </fieldset>
                </g:form>

                <form action="../../event/create" >
                    <button class="btn btn-success" style="margin-left: 3px" name="venue" value="${this.venue.name}">Create Event</button>
                </form>

           </g:if>
        <ol class="property-list venue">
    
        <li class="fieldcontain">
            <span id="email-label" class="property-label">Email</span>
            <div class="property-value" aria-labelledby="email-label">${venue.email}</div>
        </li>
    
        <li class="hide">
            <span id="latitude-label" class="property-label">Latitude</span>
            <div class="property-value" aria-labelledby="latitude-label">${venue.latitude}</div>
        </li>
    
        <li class="fieldcontain">
            <span id="location-label" class="property-label">Location</span>
            <div class="property-value" aria-labelledby="location-label">${venue.location}</div>
        </li>
    
        <li class="hide">
            <span id="longitude-label" class="property-label">Longitude</span>
            <div class="property-value" aria-labelledby="longitude-label">${venue.longitude}</div>
        </li>
    
        <li class="fieldcontain">
            <span id="name-label" class="property-label">Name</span>
            <div class="property-value" aria-labelledby="name-label">${venue.name}</div>
        </li>
    
        <li class="fieldcontain">
            <span id="phoneNumber-label" class="property-label">Phone Number</span>
            <div class="property-value" aria-labelledby="phoneNumber-label">${venue.phoneNumber}</div>
        </li>
    
        <li class="fieldcontain">
            <span id="username-label" class="property-label">Username</span>
            <div class="property-value" aria-labelledby="username-label">${venue.username}</div>
        </li>
    
</ol>

            <div class="venueContainer" id="map"></div>



        </div>
        <div class="venueContainer">
         <h2>Upcoming Events</h2>
            <div class="venueArtistList">
                <ul class="list-unstyled">
                    <g:each in="${eventList}" var="event">
                        <li>
                            <ul class="list-unstyled">
                                <li class="eventTitle">
                                    <a href="/event/show/${event.id}">${event.title}</a>,
                                </li>
                                <li class="eventLocation">
                                    ${event.venue} - ${event.location}
                                </li>
                                <li class="eventDate">
                                    <g:formatDate date="${event.start_time}" type="both" style="SHORT"/> - <g:formatDate date="${event.end_time}" type="both" style="SHORT"/>
                                </li>
                            </ul>
                        </li>
                    </g:each>
                </ul>
            </div>
        </div>
    </body>
</html>
