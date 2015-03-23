
<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="url">${pageContext.request.requestURL}</c:set>
<base
	href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>reales | real estate web application</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css" rel="stylesheet"/>

    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="css/simple-line-icons.css" rel="stylesheet">
    <link href="css/jquery-ui.css" rel="stylesheet">
    <link href="css/datepicker.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/app.css" rel="stylesheet" id="app">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="notransition">

<!-- Header -->

<div id="header">
    <div class="logo">
        <a href="index.html">
            <div class="home-logo osLight"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></div>
        </a>
    </div>
    <div class="headerUserWraper">
        <div class="home-nav">
				<ul>
					<li><a href='<spring:url value="/"/>'
						class="btn btn-green isThemeBtn">Home</a></li>
					<security:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href='<spring:url value="/admin.html"/>'
							class="btn btn-green isThemeBtn">Admin</a></li>
					</security:authorize>
					<security:authorize
						access="hasAnyRole('ROLE_BUYER', 'ROLE_SELLER')">
						<li><a href='<spring:url value="/account.html"/>'
							class="btn btn-green isThemeBtn">Account</a></li>
					</security:authorize>
					<security:authorize access="! isAuthenticated()">
						<li><a href='<spring:url value="/register.html"/>'
							class="btn btn-green isThemeBtn">Register</a></li>
						<li><a href='<spring:url value="/login.html"/>'
							class="btn btn-green isThemeBtn">Login</a></li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<li><a href='<spring:url value="/logout"/>'
							class="btn btn-green isThemeBtn">Logout</a></li>
					</security:authorize>
					<li></li>
				</ul>
			</div>
    </div>
</div>


<div id="leftSide"></div>

<!-- Content -->

<div id="wrapper">
<div id="mapView" class="mob-min"><div class="mapPlaceholder"><span class="fa fa-spin fa-spinner"></span> Loading map...</div></div>
<div id="content" class="mob-max">
<div class="singleTop">
    <div id="carouselFull" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselFull" data-slide-to="0" class="active"></li>
            <li data-target="#carouselFull" data-slide-to="1"></li>
            <li data-target="#carouselFull" data-slide-to="2"></li>
            <li data-target="#carouselFull" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <img src="images/prop/4-1.png" alt="First slide">
                <div class="container">
                    <div class="carousel-caption">

                    </div>
                </div>
            </div>
            <div class="item">
                <img src="images/prop/4-2.png" alt="Second slide">
                <div class="container">
                    <div class="carousel-caption">

                    </div>
                </div>
            </div>
            <div class="item">
                <img src="images/prop/4-3.png" alt="Third slide">
                <div class="container">
                    <div class="carousel-caption">

                    </div>
                </div>
            </div>
            <div class="item">
                <img src="images/prop/4-4.png" alt="Fourth slide">
                <div class="container">
                    <div class="carousel-caption">

                    </div>
                </div>
            </div>
        </div>
        <a class="left carousel-control" href="#carouselFull" role="button" data-slide="prev"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></a>
        <a class="right carousel-control" href="#carouselFull" role="button" data-slide="next"><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
    </div>
    <div class="summary">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                <div class="summaryItem">
                    <h1 class="pageTitle">${property.name}</h1>
                    <div class="address">${property.address}</div>
                    <h1 class="pageTitle" style="color:red;">$ ${property.price}</h1>
                    <div class="clearfix"></div>
                    <ul class="features">
                        <li><div>${property.bedroom} Bedrooms</div></li>
                        <li><div>${property.bathroom} Bathrooms</div></li>
                        <li><div>2750 Sq Ft</div></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                <div class="agentAvatar summaryItem">
                    <div class="clearfix"></div>
                    <img class="avatar agentAvatarImg" src="images/avatar-2.png" alt="avatar">
                    <div class="agentName">Jane Smith</div>
                    <a data-toggle="modal" href='<spring:url value="/property/contactAgent/${property.id}.html"/>' 
                    class="btn btn-lg btn-round btn-green contactBtn isThemeBtn">Contact Seller</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<div class="description">
    <h3>Description</h3>
    <p>${property.description}</p>
</div>

<div class="amenities">
    <h3>Amenities</h3>
    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 amItem"><span class="fa fa-car"></span> Garage</div>
        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 amItem"><span class="fa fa-tint"></span> Outdoor Pool</div>
        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 amItem inactive"><span class="fa fa-leaf"></span> Garden</div>
        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 amItem inactive"><span class="fa fa-shield"></span> Security System</div>
        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 amItem"><span class="fa fa-wifi"></span> Internet</div>
        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 amItem inactive"><span class="fa fa-phone"></span> Telephone</div>
        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 amItem"><span class="fa fa-asterisk"></span> Air Conditioning</div>
        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 amItem inactive"><span class="fa fa-sun-o"></span> Heating</div>
        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 amItem"><span class="fa fa-fire"></span> Fireplace</div>
        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 amItem"><span class="fa fa-arrows-v"></span> Balcony</div>
        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 amItem"><span class="fa fa-desktop"></span> TV Cable</div>
    </div>
</div>
</div>
<div class="clearfix"></div>
</div>

<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery-ui-touch-punch.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/jquery.placeholder.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/jquery.visible.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=true&amp;libraries=geometry&amp;libraries=places" type="text/javascript"></script>
<script src="js/infobox.js"></script>
<script src="js/jquery.tagsinput.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>

<script type="text/javascript">
	var title = "<c:out value="${property.name}"/>"
	var price = "<c:out value="$ ${property.price}"/>"
	var latitude = 	"<c:out value="${property.lat}"/>"
	var longitude = "<c:out value="${property.lng}"/>"
</script>
<script src="js/appsingle.js" type="text/javascript"></script>


</body>
</html>