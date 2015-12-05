<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><g:layoutTitle default="Grails"/></title>
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
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">1GB</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#">About</a>
                </li>
                <li>
                    <a href="#">Services</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>
            <ul class="nav navbar-nav" style="float:right">
                <li>
                    <a href="#">Login</a>
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

        <div class="col-md-3">
            <p class="lead">Nav</p>
            <div class="list-group">
                <a href="#" class="list-group-item">Setup Event</a>
                <a href="#" class="list-group-item">Search Artists</a>
                <a href="#" class="list-group-item">My Profile</a>
            </div>
        </div>

        <div class="col-md-9">

            %{-- Dynamic Content Starts Here--}%



            <g:layoutBody/>


            <br><br><br>


            <button id="get_location">Find my Geo location</button>
            <p id="demo"></p>
            <br>
            <div>Enter Address</div>
            <input id="address">
            <br>
            <button id="search_address">Search MapQuest</button>

            <br><br><br><br>


            <div id="map" style="height:400px"></div>




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
            <div class="col-lg-12">
                <p>Copyright &copy; Hackers</p>
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

