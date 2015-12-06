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


            <f:display bean="venue" />

            <div id="map"></div>


            <form action="../../event/create" >
                <button name="venue" value="${this.venue.name}">Create Event</button>
            </form>

            <g:form resource="${this.venue}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.venue}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
         <h2>Your Upcoming events</h2>
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
                                    ${event.start_time} - ${event.end_time}
                                </li>
                            </ul>
                        </li>
                    </g:each>
                </ul>
            </div>
    </body>
</html>
