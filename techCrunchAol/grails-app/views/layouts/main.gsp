<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><g:layoutTitle default="1GB"/></title>
    <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>


    %{--include leaflet --}%
    <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css" />
    <script src="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js"></script>
    <script src="http://www.mapquestapi.com/sdk/leaflet/v2.s/mq-map.js?key=rfcYFGTiHFcPCCc3nORTNEDnHuBpte9n"></script>


    %{--end leaflet--}%

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="bootstrap.css"/>
    %{--<asset:stylesheet src="main.css"/>--}%
    <asset:stylesheet src="shop-homepage.css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<!-- Navigation -->
<g:if test="${session.Artist}">
    <nav class="artistNavbar navbar navbar-inverse navbar-fixed-top" role="navigation">
</g:if>
<g:elseif test="${session.Venue}">
    <nav class="venueNavbar navbar navbar-inverse navbar-fixed-top" role="navigation">
</g:elseif>
<g:else test="${session.Venue}">
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
</g:else>

    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a href="/"><img src="/assets/1025_logo1_white.png" height="50px" /></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav" style="float:right">
                <li>
                    <g:if test="${session.Artist}">
                        <g:link uri="/artist/show/1">U2</g:link>
                    </g:if>
                    <g:if test="${session.Venue}">
                        <g:link uri="/venue/show/1">Brazen Head</g:link>
                    </g:if>

                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<!-- Page Content -->
<div class="container">

    <div class="row">

        %{--<!-- LEFT NAV -->--}%
        %{--<g:if test="${session.Artist} || ${session.Venue}">--}%
            %{--<div class="col-md-3">--}%
                %{--<p class="lead">Nav</p>--}%
                %{--<div class="list-group">--}%

                    %{--<g:if test="${session.Artist}">--}%
                        %{--<g:link uri="/artist/show/1" class="list-group-item">My Profile</g:link>--}%

                    %{--</g:if>--}%
                    %{--<g:elseif test="${session.Venue}">--}%
                        %{--<g:link uri="/event/create" class="list-group-item">Setup Event</g:link>--}%
                        %{--<a href="#" class="list-group-item">Search Artists</a>--}%
                        %{--<g:link uri="/venue/show/1" class="list-group-item">My Profile</g:link>--}%
                    %{--</g:elseif>--}%
                %{--</div>--}%
            %{--</div>--}%
        %{--</g:if>--}%

        <div class="col-md-9">

            %{-- Dynamic Content Starts Here--}%



            <g:layoutBody/>


            %{-- Dynamic Content Ends Here--}%

        </div>

    </div>

</div>
<!-- /.container -->

<div class="container">

    <hr>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-9">
                <p>Copyright &copy; Hackers.
                    <a href="http://www.freepik.com/">Freepik</a> from <a href="http://www.flaticon.com/">Flaticon</a> is licensed under <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0">CC BY 3.0</a>. Made with <a href="http://logomakr.com" title="Logo Maker">Logo Maker</a></p>
            </div>
            <div class="col-lg-3">
                Dev:
                <g:link controller="twilio">test sms</g:link> |
                <g:link uri="/" params="[artistId:1]">C.T.A.</g:link> |
                <g:link uri="/" params="[venueId:1]">C.T.V.</g:link> |
                <g:link uri="/" params="[reset:1]">reset</g:link>
            </div>
        </div>
    </footer>

</div>
<!-- /.container -->

<!-- jQuery -->
<asset:javascript src="jquery.js"/>
<asset:javascript src="bootstrap.min.js"/>

</body>
</html>

