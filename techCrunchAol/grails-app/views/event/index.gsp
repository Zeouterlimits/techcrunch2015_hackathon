<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        %{--<div>--}%
            %{--<img src="/assets/1025_logo1_black.png">--}%
        %{--</div>--}%
        <a href="#list-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="list-event" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${eventList}"  properties="['title', 'start_time', 'venue', 'confirmedArtists']" />
            
            %{--<div class="pagination">--}%
                %{--<g:paginate total="${eventCount ?: 0}" />--}%
            %{--</div>--}%

        </div>
    </body>
</html>