<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <style type="text/css">
    .venueView{
        display: none;
    }
    </style>
        <a href="#list-artist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-artist" class="content scaffold-list venueView" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${artistList}" />
        </div>

        <div class="artistView">
            <h1>Hey </h1>
            <h2>Events Looking For You</h2>
            <div class="eventArtistList">
                <ul class="list-unstyled">
                    <g:each in="${eventList}" var="event">
                        <li>
                            <ul class="list-unstyled">
                                <li class="eventTitle">
                                    ${event.title},
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

            <div class="pagination">
                <g:paginate total="${artistCount ?: 0}" />
            </div>
        </div>
    </body>
</html>