<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'venue.label', default: 'Venue')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-venue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="create-venue" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.venue}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.venue}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    %{--<f:all bean="venue"/>--}%



                    <f:with bean="venue">
                        <f:field property="name"/>
                        <f:field property="email"/>
                        <g:field name="latitude" type="hidden" />
                        <g:field name="longitude" type="hidden"/>
                        <f:field property="phoneNumber"/>
                        <g:field name="profilePicPath" value="/some/path" type="hidden"/>
                        <f:field property="username"/>
                        <f:field property="password"/>
                        <f:field property="location"/>
                    </f:with>

                    <div class="eventButtons fieldcontain" style="padding-left:0px;">
                        %{--<input type="submit" name="create" class="btn btn-success" value="Create" id="create">--}%
                        <label>Set Location</label>
                        <button class="btn btn-default btn btn-default" id="get_location">Use Geo-Location</button>
                    </div>

                    <div class="eventButtons fieldcontain" style="padding-left:0px;">
                        %{--<input type="submit" name="create" class="btn btn-success" value="Create" id="create">--}%
                        <label>Search via MapQuest</label>
                        <input id="address">
                        <button class="btn btn-default btn btn-success" id="search_address">Search MapQuest</button>
                    </div>
                    %{--<p id="demo"></p>--}%

                    <div id="map" class="venueContainer"></div>



                    %{--Email--}%
                    %{--Favourite Artist--}%
                    %{--Favourite Genre--}%
                    %{--Location--}%
                    %{--Name--}%
                    %{--Password--}%
                    %{--Phone NUmber--}%
                    %{--Profile Pic--}%
                    %{--Username--}%

                </fieldset>
                <fieldset class="eventButtons">
                    <g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
