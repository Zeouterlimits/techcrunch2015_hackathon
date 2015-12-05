<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-artist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <img src="../../assets/artist_picture.jpg"% height=200/>
        <div id="show-artist" class="content scaffold-show" role="main">
            <h1><g:message code="${artist.name}" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="artist" />
            <g:form resource="${this.artist}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.artist}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
        
                <h2>Your Upcoming Events</h2>
                    <div class="eventArtistList">
                        <ul class="list-unstyled">
                            <g:each in="${confirmedEvents}" var="event">
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
                    
                <h2>Events You Have Applied For</h2>
                    <div class="eventArtistList">
                        <ul class="list-unstyled">
                            <g:each in="${appliedEvents}" var="event">
                                <li>
                                    <ul class="list-unstyled">
                                        <li class="eventTitle">
                                            <a href="/event/show/${event.id}">${event.title}</a>,
                                        </li>
                                        <li class="eventLocation">
                                            ${event.venue} - ${event.location}
                                        </li>
                                        <li class="eventDate">
                                            <g:formatDate date="${event.start_time}" type="both" style="SHORT"/> - <g:formatDate date="${event.end_time}" type="both" style="SHORT"/>                                        </li>
                                    </ul>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                    
        <h2>Events Looking For You</h2>
                    <div class="eventArtistList">
                        <ul class="list-unstyled">
                            <g:each in="${eventList}" var="event">
                                <li>
                                    <ul class="list-unstyled">
                                        <li class="eventTitle">
                                            <a href="/event/show/${event.id}">${event.title}</a>,
                                        </li>
                                        <li class="eventLocation">
                                            <g:each in="${venueList}" var="venue">
                                                <g:if test="${venue.name == event.venue}">
                                                    <a href="/venue/show/${venue.id}">
                                                </g:if>
                                            </g:each>
                                             ${event.venue} </a> - ${event.location}
                                        </li>
                                        <li class="eventDate">
                                            <g:formatDate date="${event.start_time}" type="both" style="SHORT"/> - <g:formatDate date="${event.end_time}" type="both" style="SHORT"/>                                        </li>
                                    </ul>
                                </li>
                            </g:each>
                        </ul>
                    </div>
    </body>
</html>
