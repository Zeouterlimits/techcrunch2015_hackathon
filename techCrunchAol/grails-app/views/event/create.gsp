grails <!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="create-event" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.event}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.event}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <f:all bean="event" except="appliedArtists,confirmedArtists,start_time,end_time"/>
                    <div class='fieldcontain required'>
                        <label for='venue'>Start Date</label>
                        <span class='required-indicator'>*</span>
                        <g:datePicker name="start_time" value="${new Date()}" precision="minute" relativeYears="${0..7}"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='venue'>End Date</label>
                        <span class='required-indicator'>*</span>
                        <g:datePicker name="end_time" value="${new Date()}" precision="minute" relativeYears="${0..7}"/>
                    </div>
                </fieldset>
                <fieldset>
                    <g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
