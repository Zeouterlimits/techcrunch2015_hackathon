<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="show-event" class="content scaffold-show" role="main">
            <h1><g:message code="${event.title}" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
           <!-- <f:display bean="event" />-->
           
            <g:if test="${session.Artist}">
             <!--if artist-->
            <g:form class="eventButtons" resource="${this.event}" method="PUT" action="apply">
                <fieldset>
                   <input class="btn btn-success" type="submit" value="${message(code: 'default.button.apply.label', default: 'Apply')}" onclick="return confirm('${message(code: 'default.button.apply.confirm.message', default: 'Are you sure you want to apply for this event?')}');" />             
                </fieldset>
            </g:form>
            </g:if>
                    
           <g:if test="${session.Venue}">
                                    <!--if venue-->
            <g:form class="eventButtons"resource="${this.event}" method="DELETE">
                <fieldset >
                    <g:link class="btn btn-default" action="edit" resource="${this.event}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to delete this event?')}');" />
                   
                </fieldset>
            </g:form>
                    </g:if>
           
     <ol class="property-list event">
    
        <li class="fieldcontain">
            <span id="appliedArtists-label" class="property-label">Applied Artists</span>
            <div class="property-value" aria-labelledby="appliedArtists-label">
            
           
            <ul>
                 
            <g:each in="${event.appliedArtists}" var="artist" >
            
                 <g:if test="${session.Artist}">
                 <!--if artist-->
                    <li><a href="/artist/show/${artist.id}">${artist.name}</a></li>
                </g:if>
            
            <g:if test="${session.Venue}">
                <!--if venue-->
                <g:form resource="${this.event}" method="PUT" action="approve">
                       <li><a href="/artist/show/${artist.id}">${artist.name}</a></li>
                       <input type="submit" value="${message(code: 'default.button.approve.label', default: 'Approve')}" onclick="return confirm('${message(code: 'default.button.approve.confirm.message', default: "Are you sure you want to approve ${artist.name}?")}');" />             
                       <input type="hidden" name="artistID" value="${artist.id}" />
                </g:form>
                </g:if>
            </g:each>
            
            </ul>
            </div>
        </li>
    
        <li class="fieldcontain">
            <span id="confirmedArtists-label" class="property-label">Confirmed Artists</span>
            <div class="property-value" aria-labelledby="appliedArtists-label">
                  <ul>
                <g:each in="${event.confirmedArtists}" var="artist" >
            
                 <g:if test="${session.Artist}">
                 <!--if artist-->
                    <li><a href="/artist/show/${artist.id}">${artist.name}</a></li>
                </g:if>
            
                <g:if test="${session.Venue}">
                <!--if venue-->
                <g:form resource="${this.event}" method="PUT" action="remove">
                       <li><a href="/artist/show/${artist.id}">${artist.name}</a></li>
                       <input class="btn btn-danger" type="submit" value="${message(code: 'default.button.remove.label', default: 'Remove')}" onclick="return confirm('${message(code: 'default.button.remove.confirm.message', default: "Are you sure you want to remove ${artist.name}?")}');" />             
                       <input type="hidden" name="artistID" value="${artist.id}" />
                </g:form>
                </g:if>
            
            </g:each>
          </ul>
         </div>
        </li>
    
        <li class="fieldcontain">
            <span id="end_time-label" class="property-label">Endtime</span>
            <div class="property-value" aria-labelledby="end_time-label">${event.end_time}</div>
        </li>
    
        <li class="fieldcontain">
            <span id="location-label" class="property-label">Location</span>
            <div class="property-value" aria-labelledby="location-label">${event.location}</div>
        </li>
    
        <li class="fieldcontain">
            <span id="start_time-label" class="property-label">Start Time</span>
            <div class="property-value" aria-labelledby="start_time-label">${event.start_time}</div>
        </li>
    
        <li class="fieldcontain">
            <span id="title-label" class="property-label">Title</span>
            <div class="property-value" aria-labelledby="title-label">${event.title}</div>
        </li>
    
        <li class="fieldcontain">
            <span id="venue-label" class="property-label">Venue</span>
            <div class="property-value" aria-labelledby="venue-label">${event.venue}</div>
        </li>
    
</ol>


            

             
        
        </div>
    </body>
</html>
